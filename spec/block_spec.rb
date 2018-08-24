# frozen_string_literal: true

require 'block'
require_relative '../lib/helpers'

describe Block do
  let(:mock_previous_hash) {'previous_hash'}
  subject(:block) { described_class.new(previous_hash: mock_previous_hash) }

  it 'has a transaction array' do
   expect(block.transactions).to eq([])
  end

  it 'takes a previous hash as an argument' do
    expect(block.previous_hash).to eq('previous_hash')
  end
end
