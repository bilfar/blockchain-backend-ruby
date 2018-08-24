# frozen_string_literal: true

require 'blockchain'

describe Blockchain do
  before(:each) do
    @blockchain = Blockchain.new
    @data = { sender: 'Fred', receiver: 'Nabil', name: 'Bieber', value: 20 }
  end

  it 'should create a new transaction' do
    @blockchain.create_transaction(@data)
    expect(@blockchain.unverified_transactions.length).to eq(1)
  end
end
