# frozen_string_literal: true

require_relative './block.rb'
require 'openssl'

# Understands creating transactions and blocks
class Blockchain
  attr_reader :blocks, :unverified_transactions

  def initialize(genesis = Block.genesis)
    @blocks = [genesis]
    @unverified_transactions = []
  end

  def create_transaction(data, time = Time.new)
    transaction = { sender: data['sender'], receiver: data['receiver'],
                    name: data['name'], value: data['value'],
                    hash: hash_transaction(data, time), time: time }
    @unverified_transactions.push(transaction)
  end

  def create_block
    blocks.push(Block.new(unverified_transactions, prev_block_hash))
  end

  private

  def hash_transaction(data, time)
    sha = Digest::SHA256.new
    sha.update(data['sender'] + data['receiver'] + time.to_s)
    sha.hexdigest
  end

  def prev_block_hash
    blocks.last.hash
  end
end
