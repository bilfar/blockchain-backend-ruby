# frozen_string_literal: true

require 'block'
require_relative '../lib/helpers'

describe Block do
  let(:mock_previous_hash) {'previous_hash'}
  let(:time) { '2018-08-24 15:07:53 +0100' }
  let(:mock_transactions) do  [ {sender:'9876', receiver:'1234', name: "Spice Girls", value: 1 },
                                {sender:'9999', receiver:'1234', name: "Spice Girls", value: 1 } ]
  end
  subject(:block) do  described_class.new(transactions: mock_transactions,
                                          previous_hash: mock_previous_hash,
                                          timestamp: time)
  end

  it 'has a transaction array' do
   expect(block.transactions).to eq(mock_transactions)
  end

  it 'takes a previous hash as an argument' do
    expect(block.previous_hash).to eq('previous_hash')
  end

  it 'provides a timestamp' do
    expect(block.timestamp).to eq(time)
  end
end
