# frozen_string_literal: true

require 'block'
require_relative '../lib/helpers'

describe Block do
  let(:mock_previous_hash) {'previous_hash'}
  let(:time) { '2018-08-24 15:07:53 +0100' }
  subject(:block) { described_class.new(previous_hash: mock_previous_hash, timestamp: time) }

  it 'has a transaction array' do
   expect(block.transactions).to eq([])
  end

  it 'takes a previous hash as an argument' do
    expect(block.previous_hash).to eq('previous_hash')
  end

  it 'provides a timestamp' do
    expect(block.timestamp).to eq(time)
  end
end
