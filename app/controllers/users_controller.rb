require './config/environment'

class UsersController < ApplicationController
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
end