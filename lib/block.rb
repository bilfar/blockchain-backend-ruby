# frozen_string_literal: true

require_relative './helpers.rb'
require 'openssl'

# block class
class Block
  attr_reader :transactions, :previous_hash, :timestamp, :hash

  def initialize(transactions:, previous_hash:, timestamp: Time.now)
    @transactions = transactions
    @previous_hash = previous_hash
    @timestamp = timestamp
    @hash = calculate_hash
  end

  private

  def calculate_hash
    sha = Digest::SHA256.new
    sha.update(transactions.to_s + timestamp.to_s + previous_hash.to_s)
    sha.hexdigest
  end
end
