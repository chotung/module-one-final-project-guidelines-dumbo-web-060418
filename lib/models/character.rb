class Character < ActiveRecord::Base
	belongs_to :player
	has_many :weapons
	has_many :battles



	# def self.get_character_name(player)
	# puts "enter a character name:"
	# name1 = gets.chomp
	# Character.create(name:name1, player_id: player.id)
	# end

	def self.character_setup(player)
		puts "Enter a character name"
		name1 = gets.chomp
		current_character = Character.create(name:name1, player_id: player.id)
		puts "roll 3d6 for strength"
		str_total = current_character.roll_attributes
		current_character.update({strength: str_total})
		puts "roll 3d6 for dexterity"
		dex_total = current_character.roll_attributes
		current_character.update({dexterity: dex_total})
		puts "roll 3d6 for constitution"
		con_total = current_character.roll_attributes
		current_character.update({constitution: con_total})
		current_character
		end

	def roll_attributes
		tot = rand(6) + 1
		tot += rand(6) + 1
		tot += rand(6) +1
		puts tot
		tot
	end
end