require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
  end

  get "/" do
    erb :'user/index'
  end

  get '/home' do
    redirect '/'
  end

  get '/account/edit' do
    erb :'user/edit'
  end


end