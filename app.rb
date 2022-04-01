require 'sinatra/base'
require 'sinatra/reloader'
require 'uri'
require 'sinatra/flash'
require_relative './database_connection_setup.rb'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  configure :development do
    register Sinatra::Reloader
  end
  register Sinatra::Flash

  get '/' do
    erb(:index, locals: { peeps: Peep.all })
  end

  post '/new_peep' do
    Peep.create(params[:peep_text], params[:username])
    redirect '/'
  end

  post "/search" do
    erb(:search_results, locals: { results: Peep.search(params[:search_text]), search_term: params[:search_text] })
  end


  run! if app_file == $0
end