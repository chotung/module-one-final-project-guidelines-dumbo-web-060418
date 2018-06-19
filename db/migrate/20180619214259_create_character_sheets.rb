class CreateCharacterSheets < ActiveRecord::Migration[5.0]
  def change
  	create_table do |t|
  	t.integer :character_id
  end
end
