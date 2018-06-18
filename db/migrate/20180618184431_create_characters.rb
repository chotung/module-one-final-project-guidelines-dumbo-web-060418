class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
        t.string :name
        t.integer :strength
        t.integer :dexterity
        t.integer :constitution
        t.integer :hit_point
        t.integer :armor_value
        t.integer :experience_total
        # t.integer :level
        # t.string :armor
        t.string :main_hand
        t.string :off_hand
        t.integer :player_id
    end
  end
end
