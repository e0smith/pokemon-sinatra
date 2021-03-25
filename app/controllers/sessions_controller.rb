require './config/environment'
class SessionsController < ApplicationController
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

    delete '/logout' do
    end
end