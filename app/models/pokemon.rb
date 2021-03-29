class Pokemon < ActiveRecord::Base
    has_many :team_pokemon
    has_many :teams, through: :team_pokemon
    
    def self.pokemon_data(id)
        information = {
            "name" => [],
            "abilities" => [],
            "types" => [],
            "moves" => []}
        pokemon = Pokemon.find(id)
        @info = HTTParty.get(pokemon.url)
        information["name"] << pokemon.name
        @info["abilities"].each do |x|
            information["abilities"] << x["ability"]["name"]
        end
        @info["types"].each do |x|
          information["types"] << x["type"]["name"]
        end
        @info["moves"].each do |x|
          information["moves"] << x["move"]["name"]
        end
        return information
    end
end