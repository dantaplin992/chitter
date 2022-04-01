require 'sinatra/base'
require 'sinatra/reloader'
require 'uri'
require 'sinatra/flash'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  configure :development do
    register Sinatra::Reloader
  end
  register Sinatra::Flash

  get '/' do
    "Chitter"
  end

  run! if app_file == $0
end