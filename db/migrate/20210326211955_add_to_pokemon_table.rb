class AddToPokemonTable < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :abilities, :string
    add_column :pokemons, :sprites, :string
    add_column :pokemons, :types, :string
    add_column :pokemons, :moves, :string
  end
end
