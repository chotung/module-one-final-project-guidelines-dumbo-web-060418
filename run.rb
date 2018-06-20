require_relative 'config/environment'

ActiveRecord::Base.logger = nil # comment out if want to see SQL logs

current_character = Game.welcome
current_game = Game.new_game(current_character)

current_game.weapon_choice

current_game.character.character_sheet

# status = :in_town

# Game.current_status(status, current_game.character)

# status = current_game.town(current_game.character)

# if status == :adventuring

	monster_type = current_game.adventure_one(current_game.character)

	current_monster = Monster.generate_monster(monster_type)

	encounter_result = Battle.combat(current_game.character, current_monster)

current_game.character.character_sheet

# 	# 	if encounter_result = "alive"
# 	# 	# more encounters
# 	# 	puts 'what do you wanna do now?'
# 	# 	# gets.chomp
# 	# 		#if...
# 	# else Game.game_over

# else current_game.town(current_game.character)
# end


# def self.current_status(status, character)
# 	status = current_game.town(character)

# 	if status == :adventuring
		
# 	monster_type = current_game.adventure_one(character)

# 	current_monster = Monster.generate_monster(monster_type)

# 	encounter_result = Battle.combat(character, current_monster)

# 	else
# 		current_status(:in_town, character)
# 	end
# end




