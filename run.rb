require_relative 'config/environment'





# def get_username
# 	name1 = gets.chomp
# 	puts "Welcome, #{name1}"
# 	Player.find_or_create_by(username:name1)
# end

# def get_character_name(player)
# 	puts "enter a character name:"
# 	name1 = gets.chomp
# 	Character.create(name:name1, player_id: player.id)
# end


current_character = Game.welcome
current_game = Game.new_game(current_character)
current_game.weapon_choice
