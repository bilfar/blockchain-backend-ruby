# frozen_string_literal: true

require 'blockchain'

describe Blockchain do
  let(:new_block) { double(:block_instance, previous_hash: '234567890') }
  let(:block_class) { double(:block_class, new: new_block) }
  let(:current_block) { double(:block_instance, hash: '123456789') }

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

  describe '.mine_block' do
    context 'unverified transaction is not empty' do
      before(:each) do
        @blockchain.create_transaction(@data)
        @blockchain.mine_block
      end

      it 'clear the unverified_transactions array' do
        expect(@blockchain.unverified_transactions.length).to eq 0
      end

      it "should add a new block to 'blocks' array" do
        expect(@blockchain.blocks.length).to eq 2
      end
    end

    context 'previous hash of new block does not match current block hash' do
      it 'raises an error' do
        blocks = [current_block]
        invalid_blockchain = Blockchain.new(blocks)
        invalid_blockchain.create_transaction(@data)
        expect { invalid_blockchain.mine_block(block_class) }
          .to raise_error('Block is invalid')
      end
    end
  end
end
