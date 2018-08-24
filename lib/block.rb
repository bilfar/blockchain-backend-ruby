# frozen_string_literal: true

require_relative './helpers.rb'
require 'openssl'


class Block
  attr_reader :transactions, :previous_hash

  def initialize(previous_hash: previous_hash)
    @transactions= []
    @previous_hash = previous_hash
  end

end
