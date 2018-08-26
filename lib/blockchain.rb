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

  def mine
    raise 'It is empty' if @unverified_transactions.empty?
    create_block
    @unverified_transactions.clear
  end

  def create_block(block_class = Block)
    block = block_class.new(unverified_transactions, blocks.last.hash)
    raise 'Block is invalid' if invalid?(block)
    blocks.push(block)
  end

  private

  def hash_transaction(data, time)
    sha = Digest::SHA256.new
    sha.update(data['sender'] + data['receiver'] + time.to_s)
    sha.hexdigest
  end

  def invalid?(new_block)
    current_block = blocks.last
    new_block.previous_hash != current_block.hash
  end
end
