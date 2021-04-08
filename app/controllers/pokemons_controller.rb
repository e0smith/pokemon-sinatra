require './config/environment'
require './app/models/pokemon.rb'
require 'pry'
class PokemonsController < ApplicationController

  #-------------------------POKEDEX CODE START--------------------------
    get '/pokedex' do
        @pokemons = Pokemon.all
        erb :'pokedex-no-check/index'
    end

    get '/pokedex/:id' do
      @info = Pokemon.pokemon_data(params[:id])
      erb :'pokedex-no-check/view'
    end
  #-------------------------POKEDEX CODE END---------------------------
#create if not logged in to protect user data
  #---------------------POKEMON TEAMS CODE START-----------------------
    get '/teams' do 
      redirect_if_not_logged_in
        
      @teams = current_user.teams
      erb :'team/view' 
    end

    get '/teams/new' do 
      redirect_if_not_logged_in
        
      erb :'team/newteam' 
    end

    post '/teams/new' do 
      redirect_if_not_logged_in

      Team.create(team_name: params[:team_name] , user_id: current_user.id)
      redirect '/teams' 
    end

    get '/teams/:id/pokemon' do
      redirect_if_not_logged_in

      @pokemon = current_user.teams.find(params[:id]).pokemons
      @id = params[:id]
      erb :'team/pokemon' 
    end

    get '/teams/:id/pokemon/pokedex' do
      redirect_if_not_logged_in

      @pokemons = Pokemon.all
      @id = params[:id]
      erb :'team/pokedex/index'
    end

    post '/teams/:id/pokemon/pokedex' do
      team = Team.find(params[:id])
      if team.user == current_user
        params[:team][:pokemon_ids].each do |id|
        TeamPokemon.create(team_id: params[:id], pokemon_id: id)
        end
      end
      redirect "/teams"
    end

    delete '/teams/:id' do
      team = Team.find(params[:id])
      if team.user == current_user
        team = Team.find(params[:id])
        @team = Team.find(params[:id])
        @team.destroy
      end
      redirect '/teams'
    end

    delete '/teams/:id/pokemon/:pokemon_id' do
      team = Team.find(params[:id])
      if team.user == current_user
        @pokemon = TeamPokemon.find_by(team_id: params[:id], pokemon_id: params[:pokemon_id])
        @pokemon.destroy
      end
      redirect "/teams/#{params[:id]}/pokemon"
    end
  #---------------------POKEMON TEAMS CODE END-------------------------

  # get '/teams/all' do
  #   @team_all = Team.all
  #   erb :'team/all'
  # end
end