# frozen_string_literal: true

require_relative './helpers.rb'
require 'openssl'


class Block
  attr_reader :transactions

  def initialize
    @transactions= []
  end

end
