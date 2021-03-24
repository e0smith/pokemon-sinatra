require 'pry'
require './app/models/pokemon'

def fetch_pokemon
    url = "https://pokeapi.co/api/v2/pokemon?limit=151"
    response = HTTParty.get(url)
    response["results"].each do |info|
        Pokemon.create(info)
    end
    # fetch_abilities(response["results"])
end

# def fetch_abilities(results)
#     results.each do |x|
#         response = HTTParty.get(x["url"])
#         binding.pry
#         Pokemon.create(response)
#     end
# end

fetch_pokemon