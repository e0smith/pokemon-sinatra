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
      erb :'team/view' #lists all current users teams
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
      @id = params[:id]
      erb :'team/pokemon'
    end

    get '/teams/:id/pokemon/pokedex' do
      @pokemons = Pokemon.all
      @id = params[:id]
      erb :'pokedex/index'
    end

    post '/teams/:id/pokemon/pokedex' do
      params[:team][:pokemon_ids].each do |id|
        TeamPokemon.create(team_id: params[:id], pokemon_id: id)
      end
      redirect "/teams"
    end

    delete '/teams/:id' do
      @team = Team.find(params[:id])
      @team.destroy
      redirect '/teams'
    end

    delete '/teams/:id/pokemon/:pokemon_id' do
      @pokemon = TeamPokemon.find_by(team_id: params[:id], pokemon_id: params[:pokemon_id])
      @pokemon.destroy
      redirect "/teams/#{params[:id]}/pokemon"
    end
  #---------------------POKEMON TEAMS CODE END-------------------------
end