class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name 
      t.string :url 
      t.integer :team_id
    end
  end
end
