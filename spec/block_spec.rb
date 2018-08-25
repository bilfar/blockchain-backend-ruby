# frozen_string_literal: true

require 'block'

describe Block do
  let(:mock_previous_hash) { 'previous_hash' }
  let(:time) { '2018-08-24 15:07:53 +0100' }
  let(:mock_transactions) do
    [
      { sender: '9876', receiver: '1234', name: 'Spice Girls', value: 1 },
      { sender: '9999', receiver: '1234', name: 'Spice Girls', value: 1 }
    ]
  end

  subject(:block) do
    described_class.new(mock_transactions, mock_previous_hash, time)
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

  it 'return a calculate_hash' do
    expect(block.hash.length).to eq 64
  end
end
