class Team < ActiveRecord::Base
    belongs_to :user
    has_many :team_pokemon
    has_many :pokemons, through: :team_pokemon
end