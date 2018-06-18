class CreateMonsters < ActiveRecord::Migration[5.0]

  def change
    create_table :monsters do |t|
        t.string :name
        t.integer :strength
        t.integer :dexterity
        t.integer :constitution
        t.integer :hit_point
        t.integer :armor_value
    end
  end
end
