require './config/environment'
require 'pry'
class PokemonsController < ApplicationController

  #-------------------------POKEDEX CODE START--------------------------
    get '/pokedex' do
        @pokemons = Pokemon.all
        erb :'pokedex/index'
    end

    get '/pokedex/:id' do
      @abilities = []
      @types = []
      @moves = []
      pokemon = Pokemon.find(params[:id])
      @info = HTTParty.get(pokemon.url)
      @info["abilities"].each do |x|
          @abilities << x["ability"]["name"]
      end
      @info["types"].each do |x|
        @types << x["type"]["name"]
      end
      @info["moves"].each do |x|
        @moves << x["move"]["name"]
      end
      erb :'pokedex/view'
    end
  #-------------------------POKEDEX CODE END---------------------------

  #---------------------POKEMON TEAMS CODE START-----------------------
    
end