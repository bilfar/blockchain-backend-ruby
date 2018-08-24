# frozen_string_literal: true

require 'blockchain'

describe Blockchain do
  before(:each) do
    @blockchain = Blockchain.new
  end

  it 'should create a new transaction' do
    @blockchain.create_transaction('Fred', 'nabil', 'Justin Bieber', 20)
    expect(@blockchain.unverified_transactions.length).to eq(1)
  end
end
