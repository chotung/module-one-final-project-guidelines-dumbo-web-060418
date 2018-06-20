class Game < ActiveRecord::Base
	belongs_to :character


	def self.welcome
		puts "hello!"
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts "        it's.............."
		puts ""
		puts " ▄▀▀█▄▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀▄ ▀▄  ▄▀▀▀▀▄    ▄▀▀█▄▄▄▄  ▄▀▀▀▀▄   ▄▀▀▄ ▀▄ "
		puts "█ ▄▀   █ █   █    █ █  █ █ █ █         ▐  ▄▀   ▐ █      █ █  █ █ █ "
		puts "▐ █    █ ▐  █    █  ▐  █  ▀█ █    ▀▄▄    █▄▄▄▄▄  █      █ ▐  █  ▀█ "
		puts "  █    █   █    █     █   █  █     █ █   █    ▌  ▀▄    ▄▀   █   █  "
		puts " ▄▀▄▄▄▄▀    ▀▄▄▄▄▀  ▄▀   █   ▐▀▄▄▄▄▀ ▐  ▄▀▄▄▄▄     ▀▀▀▀   ▄▀   █   "
		puts "█     ▐             █    ▐   ▐          █    ▐            █    ▐   "
		puts "▐                   ▐                   ▐                 ▐        "
		puts " ▄▀▀▀█▀▀▄  ▄▀▀█▀▄    ▄▀▀▄ ▄▀▄  ▄▀▀█▄▄▄▄                            "
		puts "█    █  ▐ █   █  █  █  █ ▀  █ ▐  ▄▀   ▐                            "
		puts "▐   █     ▐   █  ▐  ▐  █    █   █▄▄▄▄▄                             "
		puts "   █          █       █    █    █    ▌                             "
		puts " ▄▀        ▄▀▀▀▀▀▄  ▄▀   ▄▀    ▄▀▄▄▄▄                              "
		puts "█         █       █ █    █     █    ▐                              "
		puts "▐         ▐       ▐ ▐    ▐     ▐       "
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""


		
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

	def ask_weapon
		puts "Hello #{self.character.name} do you want a weapon?"
		puts " yes  |  no"
			input = gets.chomp.downcase

			case input
				when 'y', 'yes'
					sleep(1)
					puts "Amazing. I knew you would"
					return true
				else
					sleep(1)
					puts "You should really take a weapon. The dungeon is dangerous."
					ask_weapon
				end
		end

		def weapon_choice

			if ask_weapon == true

				puts "What weapon would you like?"#if yes give them the choice of weapon
				puts " Club  |  Dagger  |  Sword  |  Axe "
				sleep(3)
				weapon_input = gets.chomp.downcase
				if weapon_input == "sword"
					weapon = Weapon.find_by(id: 3).name
					self.character.update({main_hand: weapon})
				elsif weapon_input == "club"
					weapon1 = Weapon.find_by(id: 1).name
					self.character.update({main_hand: weapon1})
				elsif weapon_input == "axe"
					weapon1 = Weapon.find_by(id: 4).name
					self.character.update({main_hand: weapon1})
				elsif weapon_input == "dagger"
					weapon1 = Weapon.find_by(id: 2).name
					self.character.update({main_hand: weapon1})
				elsif weapon_input == "+1 sword"
					weapon1 = Weapon.find_by(id: 11).name
					self.character.update({main_hand: weapon1})
				else weapon_choice
				end
			end

			# binding.pry
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
		def town(character)
			puts "You are milling about in town swinging your #{character.main_hand}"
			puts ""
			puts ""
			puts "Your insatiable thirst for adventure compells you you leave. Do you want to travel to the edge of town?"
			puts ""
			puts " yes  |  no"
			answer = gets.chomp.downcase
			case answer
				when "yes", "y"
					puts "You leave town to test your mettle in the dungeon."
					puts "It's DUNGEON TIME!!!!"
					status = :adventuring
					status
				when "no", "n"
					# puts "You try to run, but you are surrounded... You have been Slain..." if player HP reaches zero
					puts "You are a coward. Have fun swinging your #{character.main_hand} all by yourself."
					status = :in_town
					status
				else
					sleep(2)
					puts "Come again?"
					town(character)
			end

		end



		def adventure_one(character)
			puts ""
			puts ""
			puts " #{character.name}, you find yourself surrounded by goblins you must defend yourself, do you fight? Yes or No?"
		
			answer = gets.chomp.downcase

			case answer
				when "yes", "y"
					puts "One rather large Goblin steps forward to challenge you..."
					puts "the fight begins"
					monster_type = "Goblin"
					monster_type

				when "no", "n"
					# puts "You try to run, but you are surrounded... You have been Slain..." if player HP reaches zero
					puts "You run like a coward!!!"
				else
					puts "What's that?"
					adventure_one(character)
			end
		end

		def adventure_two(character)
			puts ""
			
		end


		def adventure_three(character)
			
		end

		def adventure_four(character)
			
		end

		def adventure_five(character)
			
		end		


		def adventure_six(character)
			
		end

		def adventure_seven(character)
			
		end

		def self.game_over
			puts " "
			puts " "
			puts " "
			puts " "
			puts " "
			puts " "
			puts " "
			puts " "
			puts " "
			puts " "
			puts " "
			puts "GAME OVER!!!!"
		end

end#class end
