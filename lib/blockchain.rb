# frozen_string_literal: true

# Understands creating transactions and blocks
class Blockchain
  attr_reader :unverified_transactions

  def initialize
    @unverified_transactions = []
  end

  def create_transaction(data)
    transaction = { sender: data['sender'], receiver: data['receiver'],
                    name: data['name'], value: data['value'], time: Time.new }
    @unverified_transactions.push(transaction)
  end
end
