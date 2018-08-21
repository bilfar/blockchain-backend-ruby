require 'sinatra'

# Understands sending and receiving transaction hashes
class HelloWorldApp < Sinatra::Base
  get '/' do
    'Hello, world!'
  end
end
