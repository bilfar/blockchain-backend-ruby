# frozen_string_literal: true

require 'json'
require 'sinatra/base'
require './lib/blockchain'

# Understands sending and receiving transaction hashes
class BlockchainApp < Sinatra::Base
  set :blockchain, Blockchain.new

  get '/' do
    erb(:index)
  end

  post '/blocks/create' do
    data = JSON.parse(request.body.read)['params']
    settings.blockchain.create_transaction(data)
    halt 200
  end

  run! if app_file == $PROGRAM_NAME
end
