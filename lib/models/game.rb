class Game < ActiveRecord::Base
	belongs_to :character


	def self.welcome
		puts "hello! it's dungeon time!!!!"
		sleep(1)
		puts "enter a username"
		player = Player.get_username
		sleep(1)
		puts "it's time to roll up a character!"
		sleep(1)
		Character.character_setup(player)
		
	end

	def self.new_game(character)
		Game.create(character_id:character.id)
	end


end