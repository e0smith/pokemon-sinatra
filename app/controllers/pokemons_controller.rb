require './config/environment'

class PokemonsController < ApplicationController

    get '/pokedex' do
        @pokemons = Pokemon.all
        erb :'pokedex/index'
      end

end