# frozen_string_literal: true

require 'json'
require 'sinatra/base'
require './lib/block'

# Understands sending and receiving transaction hashes
class BlockchainApp < Sinatra::Base
  post '/blocks/create' do
    data = JSON.parse(request.body.read)['params']
    Block.create(data['sender'], data['receiver'], data['value'])
  end

  run! if app_file == $PROGRAM_NAME
end
