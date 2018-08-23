# frozen_string_literal: true

require_relative './helpers.rb'
require 'openssl'
require 'pg'

# Understands creating and retrieving new blocks
class Block
  attr_reader :id

  def initialize(id, sender, receiver, value, previous_tx, hash)
    @id = id
    @sender = sender
    @receiver = receiver
    @value = value
    @previous_tx = previous_tx
    @hash = hash
  end

  def self.all
    switch_db_if_test_env
    blocks = @con.exec 'SELECT * FROM blocks;'
    blocks.map do |block|
      Block.new(block['id'],
                block['sender'],
                block['receiver'],
                block['value'],
                block['previous_tx'],
                block['hash'])
    end
  end

  def self.create(sender, receiver, value)
    switch_db_if_test_env
    result = @con.exec 'INSERT INTO blocks (sender, receiver, value, hash, ' \
            "previous_tx) VALUES ('#{sender}', '#{receiver}', '#{value}', " \
            "'#{Block.get_hash(sender, receiver, Block.prev_tx_hash)}', " \
            " '#{Block.prev_tx_hash}') RETURNING *;"
    Block.new(result.first['id'], result.first['sender'],
              result.first['receiver'], result.first['value'],
              result.first['previous_tx'], result.first['hash'])
  end

  def self.prev_tx_hash
    switch_db_if_test_env
    block = @con.exec 'SELECT * FROM blocks ORDER BY ID DESC LIMIT 1'
    block.first['hash']
  end

  def self.get_hash(sender, receiver, previous_tx)
    sha = Digest::SHA256.new
    sha.update(sender.to_s + receiver.to_s + previous_tx.to_s)
    sha.hexdigest
  end

  private

  def ==(other)
    @id == other.id
  end
end
