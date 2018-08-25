# frozen_string_literal: true

require 'openssl'

# Understands creating transactions and blocks
class Blockchain
  attr_reader :unverified_transactions

  def initialize
    @unverified_transactions = []
  end

  def create_transaction(data)
    time = Time.new
    transaction = { sender: data['sender'], receiver: data['receiver'],
                    name: data['name'], value: data['value'],
                    hash: hash_transaction(data, time), time: time }
    @unverified_transactions.push(transaction)
  end

  private

  def hash_transaction(data, time)
    sha = Digest::SHA256.new
    sha.update(data['sender'] + data['receiver'] + time.to_s)
    sha.hexdigest
  end
end
