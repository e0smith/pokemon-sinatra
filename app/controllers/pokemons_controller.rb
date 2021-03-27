require './config/environment'
require 'pry'
class PokemonsController < ApplicationController

  @ability = []
    get '/pokedex' do
        @pokemons = Pokemon.all
        erb :'pokedex/index'
    end

    get '/pokedex/:id' do
      pokemon = Pokemon.find(params[:id])
      @info = HTTParty.get(pokemon.url)
      @info["abilities"]
      @abilities = []
      @info["abilities"].each do |x|
          @abilities << x["ability"]["name"]
      end
      erb :'pokedex/view'
    end

    
end