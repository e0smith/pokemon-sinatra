require 'pry'
require './app/models/pokemon'
require 'resolv-replace'
require 'httparty'
def fetch_pokemon
    url = "https://pokeapi.co/api/v2/pokemon?limit=10000"
    response = HTTParty.get(url)
    new_response = response.parsed_response
    fetch_abilities(response["results"])
end

def fetch_abilities(results)
    results.each do |x|
        response = HTTParty.get(x["url"])
        binding.pry
        Pokemon.create(response) 
    end
end

fetch_pokemon