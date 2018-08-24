# frozen_string_literal: true

require 'block'
require_relative '../lib/helpers'

describe Block do
  subject(:block) { described_class.new}
  it 'has a transaction array' do
   expect(block.transactions).to eq([])
 end
end
