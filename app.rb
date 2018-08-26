# frozen_string_literal: true

require 'json'
require 'sinatra/base'
require './lib/blockchain'
require 'sinatra'
require 'sinatra/flash'

# Understands sending and receiving transaction hashes
class BlockchainApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :blockchain, Blockchain.new

  get '/' do
    @blocks = settings.blockchain.blocks
    @transactions = settings.blockchain.unverified_transactions
    erb(:index)
  end

  post '/mine' do
    settings.blockchain.mine_block
    flash[:notice] = 'Blocks mined sucessfully'
    redirect '/'
  end

  post '/blocks/create' do
    data = JSON.parse(request.body.read)['params']
    settings.blockchain.create_transaction(data)
    halt 200
  end

  run! if app_file == $PROGRAM_NAME
end
