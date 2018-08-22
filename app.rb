# frozen_string_literal: true

require 'sinatra/base'

# Understands sending and receiving transaction hashes
class BlockchainApp < Sinatra::Base
  run! if app_file == $PROGRAM_NAME
end
