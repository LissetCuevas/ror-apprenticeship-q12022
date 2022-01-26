class CreateTypes < ActiveRecord::Migration[7.0]
  def up
    create_table :types do |t|
      t.string 'name', unique: true, null: false
      t.string 'generation'
      t.timestamps
    end
  end

  def down
    drop_table :types
  end
end
