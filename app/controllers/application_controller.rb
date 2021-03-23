require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "password_security"
  end

  get "/" do
    erb :'user/index'
  end

  get '/login' do
    erb :'user/login'
  end
  
  get '/signup' do
    erb :'user/signup'
  end
end