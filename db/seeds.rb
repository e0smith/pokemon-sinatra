def self.fetch_pokemon
    url = "https://pokeapi.co/api/v2/pokemon?limit=151"
    response = HTTParty.get(url) 
    fetch_abilities(response["results"])
end

def self.fetch_abilities(results)
    results.each do |x|
        response = HTTParty.get(x["url"])
        Pokemon.create(response)
    end
end