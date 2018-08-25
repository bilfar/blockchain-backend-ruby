# frozen_string_literal: true

require_relative './helpers.rb'
require 'openssl'
require 'pg'

# Understands creating and retrieving new blocks
class Block
  attr_reader :id, :receiver

  def initialize(id, data, hash)
    @id = id
    @sender = data[:sender]
    @receiver = data[:receiver]
    @value = data[:value]
    @previous_tx = data[:previous_tx]
    @hash = hash
  end

  def self.all
    switch_db_if_test_env
    blocks = @con.exec 'SELECT * FROM blocks;'
    blocks.map do |block|
      Block.new(block['id'], { sender: block['sender'],
                               receiver: block['receiver'],
                               value: block['value'],
                               previous_tx: block['previous_tx'] },
                block['hash'])
    end
  end

  def self.create(sender, receiver, value)
    switch_db_if_test_env
    result = @con.exec 'INSERT INTO blocks (sender, receiver, value, hash, ' \
            "previous_tx) VALUES ('#{sender}', '#{receiver}', '#{value}', " \
            "'#{Block.get_hash(sender, receiver, Block.prev_block_hash)}', " \
            " '#{Block.prev_block_hash}') RETURNING *;"
    create_new_block(result)
  end

  def self.prev_block_hash
    switch_db_if_test_env
    block = @con.exec 'SELECT * FROM blocks ORDER BY ID DESC LIMIT 1'
    block.first['hash']
  end

  def self.get_hash(sender, receiver, previous_block)
    sha = Digest::SHA256.new
    sha.update(sender.to_s + receiver.to_s + previous_block.to_s)
    sha.hexdigest
  end

  def self.create_new_block(result)
    Block.new(result.first['id'], { sender: result.first['sender'],
                                    receiver: result.first['receiver'],
                                    value: result.first['value'],
                                    previous_tx: result.first['previous_tx'] },
              result.first['hash'])
  end

  private

  def ==(other)
    @id == other.id
  end
end
