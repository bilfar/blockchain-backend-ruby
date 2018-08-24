# frozen_string_literal: true

# Understands creating transactions and blocks
class Blockchain
  attr_reader :unverified_transactions

  def initialize
    @unverified_transactions = []
  end

  def create_transaction(sender, receiver, name, value)
    transaction = { sender: sender, receiver: receiver,
                    name: name, value: value, time: Time.new }
    @unverified_transactions.push(transaction)
  end
end
