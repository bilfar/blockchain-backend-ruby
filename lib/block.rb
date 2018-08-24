# frozen_string_literal: true

require_relative './helpers.rb'
require 'openssl'


class Block
  attr_reader :transactions, :previous_hash, :timestamp

  def initialize(previous_hash: previous_hash, timestamp: Time.now)
    @transactions= []
    @previous_hash = previous_hash
    @timestamp = timestamp
  end

end
