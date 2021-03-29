class TeamPokemon < ActiveRecord::Base
    belongs_to :team
    belongs_to :pokemon

end