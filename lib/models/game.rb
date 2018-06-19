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


	# def yes_no_loop
	#
	# 	while true
	# 		input = gets.chomp
	# 		if input == "yes" || "Yes" || "Y" || "y"
	# 			true
	# 		elsif
	# 			input == "no" || "No" || "N" || "n"
	# 			false
	# 		end
	# 		puts "You probably should say Yes"
	# 	end
	# end


	def ask_weapon
		puts "Hello #{self.character.name} do you want a weapon?"
			input = gets.chomp.downcase
			# while input != "yes" || "Yes" || "Y" || "y"
			#
			# 	puts "you should say take a weapon"
			#
			# end

			case input
				when 'y', 'yes'
					puts "amazing I knew you would"
					return true
				else
					puts "you should say take a weapon"
					ask_weapon
				end
		end

		def weapon_choice

			if ask_weapon == true

				puts "What weapon would you like?"#if yes give them the choice of weapon
				puts "Sword"
				puts "Club"
				sleep(3)
				weapon_input	= gets.chomp.downcase

				if weapon_input == "sword"
					weapon = Weapon.find_by(id: 3).name
					# self.character.weapons << weapon
					self.character.update({main_hand: weapon})
					binding.pry
				elsif weapon_input == "club"
					weapon1 = Weapon.find_by(id: 1).name
					self.character.update({main_hand: weapon1})

				else weapon_choice
				end
			end
		end

		#update character and weapon schema


		# def ask_armor(character)
		# 	puts "Hello #{character.name} do you want armor?"
		# 		input = gets.chomp
		# 		while input != "yes" || "Yes" || "Y" || "y"
		#
		# 			puts "you should say grab some armor"
		#
		# 		end
		# 	end
		#
		# 	def armor_choice
		#
		# 		if ask_armor == true
		#
		# 			puts "What armor would you like?"#if yes give them the choice of weapon
		# 			puts "Leather armor"
		# 			puts "Plate Armor"
		# 			sleep(3)
		# 			armor_input	= gets.chomp
		#
		# 			if armor_input == "Leather Armor"
		# 				current_character.update({main_hand: "Leather Armor"})
		#
		# 			elsif armor_input == "Plate Armor"
		# 				current_character.update({main_hand: "Plate Armor"})
		#
		# 			else armor_choice
		# 			end
		# 		end
		# 	end

		# def adventure_one(character)
		# 	puts " #{character} you find yourself surrounded by goblins you must defend yourself, do you? Yes or No?"
		#
		# 	input = gets.chomp

		# 	case statement

		# 	if input == "no" || "No" || "N" || "n"
		# 		# puts "You have been Slain..." if player HP reaches zero
		# 		puts "You have ran like a coward!!!"
		#
		# 	elsif input == "yes" || "Yes" || "Y" || "y"
		# 		# hit_dice will be used in HP
		# 		#player goes first
		# 		#player attacks
		# 		#if attack is greater than monster hit_dice
		# 		#end the encounter
		# 		#else monster attacks
		# 		#subtract player Hitpoint by monster attacks
		#
		# 	end
		# end

end#class end
