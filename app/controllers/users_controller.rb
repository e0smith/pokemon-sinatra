require 'pry'
require './config/environment'

class UsersController < ApplicationController

    @pokemon_data = []

    
    get '/signup' do
        erb :'user/signup'
    end

    post '/signup' do
        user = User.new(params["user"])
        if user.save
          session["user_id"] = user.id
          redirect '/teams'
        else
          redirect '/signup'
        end
    end

    get '/account/edit' do
        erb :'user/edit'
    end
end