# frozen_string_literal: true

require 'blockchain'

describe Blockchain do
  before(:each) do
    @blockchain = Blockchain.new
    @data = { 'sender' => 'Fred', 'receiver' => 'Nabil',
              'name' => 'Justin Bieber', 'value' => 20 }
  end

  describe 'blocks' do
    it 'initializes with a Genesis Block' do
      expect(@blockchain.blocks[0].hash.length).to eq 64
    end
  end

  describe '.create_transaction' do
    before(:each) do
      @blockchain.create_transaction(@data)
    end
    it "should add a new transaction to 'unverified transactions' array" do
      expect(@blockchain.unverified_transactions.length).to eq 1
    end
    it 'hashes the new transaction' do
      expect(@blockchain.unverified_transactions[0][:hash].length).to eq 64
    end
  end

  describe './create_block' do
    before(:each) do
      @blockchain.create_block
    end
    it "should add a new block to 'blocks' array" do
      expect(@blockchain.blocks.length).to eq 2
    end
  end
end
