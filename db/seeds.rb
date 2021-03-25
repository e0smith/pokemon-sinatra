require 'pry'
require './app/models/pokemon'

def fetch_pokemon
    url = "https://pokeapi.co/api/v2/pokemon?limit=10000"
    response = HTTParty.get(url)
    response["results"].each do |info|
        Pokemon.create(info)
    end
end


fetch_pokemon