require './config/environment'
require './app/models/pokemon.rb'
require 'pry'
class PokemonsController < ApplicationController

  #-------------------------POKEDEX CODE START--------------------------
    get '/pokedex' do
        @pokemons = Pokemon.all
        erb :'pokedex/index'
    end

    get '/pokedex/:id' do
      @info = Pokemon.pokemon_data(params[:id])
      erb :'pokedex/view'
    end
  #-------------------------POKEDEX CODE END---------------------------

  #---------------------POKEMON TEAMS CODE START-----------------------
    get '/teams' do 
      @teams = current_user.teams
      erb :'team/home' #lists all current users teams
    end

    get '/teams/new' do
      erb :'team/newteam' 
    end

    post '/teams/new' do 
      Team.create(team_name: params[:team_name] , user_id: current_user.id)
      redirect '/teams'
    end

    get '/teams/:id/pokemon' do
      @pokemon = current_user.teams.find(params[:id]).pokemons
      erb :'team/pokemon'
    end

    delete '/teams/:id' do
      @teams.destroy
      redirect '/teams'
    end

  #---------------------POKEMON TEAMS CODE END-------------------------
end