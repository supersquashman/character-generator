class CreateDndCharacters < ActiveRecord::Migration
  def self.up
    create_table :dnd_characters do |t|
      t.string :name
      t.integer :seed
      t.string :settings

      t.timestamps
    end
  end

  def self.down
    drop_table :dnd_characters
  end
end
