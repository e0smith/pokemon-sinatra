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

  get '/login' do
    erb :'user/login'
  end
  
  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    end
    redirect '/home'
  end

  get '/signup' do
    erb :'user/signup'
  end

  post '/signup' do
    user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if user.save
      redirect '/home'
    else
      redirect 'user/signup'
    end
  end

  get '/home' do
    redirect '/'
  end

  get '/account/edit' do
    erb :'user/edit'
  end


end