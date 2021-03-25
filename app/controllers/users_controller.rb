require 'pry'
require './config/environment'

class UsersController < ApplicationController
    get '/signup' do
        erb :'user/signup'
    end

    post '/signup' do
        user = User.new(params["user"])
        if user.save
          session["user_id"] = user.id
          redirect '/home'
        else
          redirect 'user/signup'
        end
    end
end