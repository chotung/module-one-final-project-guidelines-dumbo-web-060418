class Game < ActiveRecord::Base
	belongs_to :character


	def self.welcome
		puts "hi"
		puts "enter a username"
		player = Player.get_username
		Character.character_setup(player)
	end

	def self.new_game(character)
		Game.create(character_id:character.id)
	end


end