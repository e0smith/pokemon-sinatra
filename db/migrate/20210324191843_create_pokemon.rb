class CreatePokemon < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemon do |t|
      t.string :name
      t.string :type
      t.string :abilities
      t.string :moves
    end
  end
end
