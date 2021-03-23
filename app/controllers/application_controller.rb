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

  post '/signup' do
    user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if user.save
      redirect 'user/home'
    else
      redirect 'user/signup'
    end
  end

end