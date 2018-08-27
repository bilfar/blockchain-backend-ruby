# frozen_string_literal: true

require 'openssl'

# Understands creating and retrieving new blocks
class Block
  attr_reader :transactions, :previous_hash, :timestamp, :hash

  def initialize(transactions, previous_hash, timestamp = Time.now)
    @transactions = transactions
    @previous_hash = previous_hash
    @timestamp = timestamp
    @hash = calculate_hash
  end

  def self.genesis
    Block.new('0000', '0000')
  end

  private

  def calculate_hash(prefix = '00')
    nonce = 0
    loop do
      hash = generate_hash(nonce)
      valid_hash?(hash, prefix) ? (return hash) : nonce += 1
    end
  end

  def generate_hash(nonce)
    hash = Digest::SHA256.new
    hash.update(nonce.to_s + transactions.to_s + timestamp.to_s + previous_hash)
    hash.hexdigest
  end

  def valid_hash?(hash, prefix)
    hash.start_with?(prefix)
  end
end
