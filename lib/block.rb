# frozen_string_literal: true

require_relative './helpers.rb'
require 'pg'

# Understands creating and retrieving new blocks
class Block
  attr_reader :id

  def initialize(id, sender, receiver, value, previous_tx)
    @id = id
    @sender = sender
    @receiver = receiver
    @value = value
    @previous_tx = previous_tx
    @hash = get_hash
  end

  def self.all
    switch_db_if_test_env
    blocks = @con.exec 'SELECT * FROM blocks;'
    blocks.map do |block|
      Block.new(block['id'],
                block['sender'],
                block['receiver'],
                block['value'],
                block['previous_tx'])
    end
  end

  def self.create(sender, receiver, value)
    switch_db_if_test_env
    result = @con.exec 'INSERT INTO blocks (sender, receiver, value,' \
                        "previous_tx) VALUES ('#{sender}', '#{receiver}'," \
                        "'#{value}', '#{Block.prev_tx_hash}') RETURNING *;"
    Block.new(result.first['id'],
              result.first['sender'],
              result.first['receiver'],
              result.first['value'],
              result.first['previous_tx'])
  end

  def self.prev_tx_hash
    switch_db_if_test_env
    block = @con.exec 'SELECT * FROM blocks ORDER BY ID DESC LIMIT 1'
    block.first['previous_tx']
  end

  private

  def get_hash
    '0' * 64
  end

  def ==(other)
    @id == other.id
  end
end
