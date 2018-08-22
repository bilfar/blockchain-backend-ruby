# frozen_string_literal: true

require 'sinatra/base'
require './lib/block'

# Understands sending and receiving transaction hashes
class BlockchainApp < Sinatra::Base

  post '/blocks/create' do
    Block.create(params[:sender], params[:receiver], params[:value], params[:previous_tx])
  end

  run! if app_file == $PROGRAM_NAME

end
