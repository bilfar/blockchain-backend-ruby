# frozen_string_literal: true

require 'block'

describe Block do

  describe '.all' do
    it 'returns an array of blocks in database' do
      expect(Block.all).to eq([])
    end
  end

  describe '.create' do
    it 'adds a new block instance to the database' do
      block = Block.create('0', '0', 5, '0')
      expect(Block.all).to include(block)
    end
  end

  describe '.previous_transaction' do
    it 'returns the previous transaction hash' do
      block = Block.create('0', '0', 5, '0' * 64)
      expect(Block.prev_transaction_hash).to eq ('0' * 64)
    end
  end

end
