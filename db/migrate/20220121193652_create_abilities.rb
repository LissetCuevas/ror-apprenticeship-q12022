class CreateAbilities < ActiveRecord::Migration[7.0]
  def up
    create_table :abilities do |t|
      t.string 'name', null: false, unique: true
      t.string 'generation'
      t.text 'effect'
      t.text 'short_effect'
      t.integer 'api_id'

      t.timestamps
    end
  end

  def down
    drop_table :abilities
  end
end
