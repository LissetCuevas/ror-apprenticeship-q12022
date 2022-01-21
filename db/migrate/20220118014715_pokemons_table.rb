# Create basic table of pokemons data
class PokemonsTable < ActiveRecord::Migration[7.0]
  def up
    create_table :pokemons do |t|
      t.string 'name', null: false, unique: true
      t.integer 'base_experience'
      t.integer 'height'
      t.boolean 'is_default', default: false
      t.integer 'order'
      t.integer 'weight'
      t.string 'location_area_encounters'
      t.boolean 'public', default: true
      t.integer 'api_id'
    end
  end

  def down
    drop_table :pokemons
  end
end
