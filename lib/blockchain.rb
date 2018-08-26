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
    unverified_transactions.push(transaction)
  end

  def mine
    raise 'It is empty' if @unverified_transactions.empty?
    create_block
    @unverified_transactions.clear
  end

  private

  def create_block
    block = Block.new(unverified_transactions, blocks.last.hash)
    blocks.push(block)
  end

  def hash_transaction(data, time)
    sha = Digest::SHA256.new
    sha.update(data['sender'] + data['receiver'] + time.to_s)
    sha.hexdigest
  end
end
