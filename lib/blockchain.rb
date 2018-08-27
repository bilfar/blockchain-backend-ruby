# frozen_string_literal: true

require_relative './block.rb'
require 'openssl'

# Understands creating transactions and blocks
class Blockchain
  attr_reader :blocks, :unverified_transactions

  def initialize(blocks = [Block.genesis])
    @blocks = blocks
    @unverified_transactions = []
  end

  def create_transaction(data, time = Time.now)
    transaction = { sender: data['sender'], receiver: data['receiver'],
                    name: data['name'], value: data['value'],
                    hash: hash_transaction(data, time), time: time }
    unverified_transactions.push(transaction)
  end

  def mine_block(block = Block)
    return if unverified_transactions.empty?
    create_block(block)
    unverified_transactions.clear
  end

  private

  def hash_transaction(data, time)
    sha = Digest::SHA256.new
    sha.update(data['sender'] + data['receiver'] + time.to_s)
    sha.hexdigest
  end

  def create_block(block)
    block = block.new(unverified_transactions.dup, blocks.last.hash)
    raise 'Block is invalid' if invalid?(block)
    blocks.push(block)
  end

  def invalid?(new_block)
    current_block = blocks.last
    new_block.previous_hash != current_block.hash
  end
end
