require './config/environment'
require 'pry'
class PokemonsController < ApplicationController

    get '/pokedex' do
        @pokemons = Pokemon.all
        erb :'pokedex/index'
    end

    get '/pokedex/:id' do
      pokemon = Pokemon.find(params[:id])
      @info = HTTParty.get(pokemon.url)
    end

    post '/pokedex/:id' do
      erb :'pokedex/view'
    end
end