class Game < ActiveRecord::Base
	belongs_to :character


	def self.welcome
		5.times { puts ""}
		puts "hello!"
		sleep(2)
   		20.times { puts ""}
		puts "        it's.............."
		puts ""
		puts " ▄▀▀█▄▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀▄ ▀▄  ▄▀▀▀▀▄    ▄▀▀█▄▄▄▄  ▄▀▀▀▀▄   ▄▀▀▄ ▀▄ ".red
		puts "█ ▄▀   █ █   █    █ █  █ █ █ █         ▐  ▄▀   ▐ █      █ █  █ █ █ ".red
		puts "▐ █    █ ▐  █    █  ▐  █  ▀█ █    ▀▄▄    █▄▄▄▄▄  █      █ ▐  █  ▀█ ".red
		puts "  █    █   █    █     █   █  █     █ █   █    ▌  ▀▄    ▄▀   █   █  ".red
		puts " ▄▀▄▄▄▄▀    ▀▄▄▄▄▀  ▄▀   █   ▐▀▄▄▄▄▀ ▐  ▄▀▄▄▄▄     ▀▀▀▀   ▄▀   █   ".red
		puts "█     ▐             █    ▐   ▐          █    ▐            █    ▐   ".red
		puts "▐                   ▐                   ▐                 ▐        ".red
		puts " ▄▀▀▀█▀▀▄  ▄▀▀█▀▄    ▄▀▀▄ ▄▀▄  ▄▀▀█▄▄▄▄                            ".red
		puts "█    █  ▐ █   █  █  █  █ ▀  █ ▐  ▄▀   ▐                            ".red
		puts "▐   █     ▐   █  ▐  ▐  █    █   █▄▄▄▄▄                             ".red
		puts "   █          █       █    █    █    ▌                             ".red
		puts " ▄▀        ▄▀▀▀▀▀▄  ▄▀   ▄▀    ▄▀▄▄▄▄                              ".red
		puts "█         █       █ █    █     █    ▐ ™                            ".red
		puts "▐         ▐       ▐ ▐    ▐     ▐       ".red
		15.times { puts ""}
  		print "Press ENTER to embark on your journey..."
  		gets

		
		puts "enter a username"
		player = Player.get_username
		puts ""
		sleep(1)
		puts "it's time to roll up a character!"
		sleep(1)
		puts ""
		Character.character_setup(player)
		
	end

	def self.new_game(character)
		Game.create(character_id:character.id)
	end

	def ask_weapon
		5.times { puts "" }
		puts "Hello #{self.character.name}, do you want a weapon?"
		puts ""
		puts " yes  |  no"
			input = gets.chomp.downcase

			case input
				when 'y', 'yes'
					sleep(1)
					puts ""
					puts "Amazing. I knew you would!"
					puts ""
					return true
				else
					sleep(1)
					puts ""
					puts "You should really take a weapon. The dungeon is dangerous."
					puts ""
					ask_weapon
				end
		end

		def weapon_choice

			if ask_weapon == true
				puts "What weapon would you like?"#if yes give them the choice of weapon
				puts ""
				puts " Club  |  Dagger  |  Rusty Sword"
				sleep(3)
				weapon_input = gets.chomp.downcase
				case weapon_input
				when "sword", "rusty sword"
					weapon = Weapon.find_by(id: 12).name
					self.character.update({main_hand: weapon})
				when "club"
					weapon1 = Weapon.find_by(id: 1).name
					self.character.update({main_hand: weapon1})
				when "dagger"
					weapon2 = Weapon.find_by(id: 2).name
					self.character.update({main_hand: weapon2})
				when "+1 sword"
					weapon3 = Weapon.find_by(id: 11).name
					self.character.update({main_hand: weapon3})
				else
					puts "Sorry, we don't have a #{weapon_input}"
					puts "try picking something we have in stock"
					weapon_choice
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
			puts ""
			puts ""
			puts "You are milling about in town staring at your #{character.main_hand}"
			puts ""
			puts ""
			puts "Your insatiable thirst for adventure compels you you leave. Do you want to travel to the edge of town?"
			puts ""
			puts " yes  |  no"
			answer = gets.chomp.downcase
			case answer
				when "yes", "y"
					sleep(1)
					puts ""
					puts "You leave town to test your mettle in the dungeon."
					sleep(2)
					system('clear')
					10.times { puts "" }
					puts "           -------------------------"
					puts "          |  It's DUNGEON TIME!!!!™ |"
					puts "           -------------------------"
					10.times { puts ""}
					character.update({status: 1})
					character
				when "no", "n"
					sleep(1)
					puts ""
					puts "You are a coward. Have fun swinging your #{character.main_hand} all by yourself."
					sleep(1)
					character.update({status: 0})
					character
				else
					sleep(2)
					puts ""
					puts "Come again?"
					town(character)
			end

		end

	def get_adventure(character) # combat must have monster_type = monter name, || if non-combat, monster_type must = :none

		def adventure_one(character)
			puts ""
			puts ""
			puts " #{character.name}, you find yourself surrounded by goblins! You must defend yourself, do you fight? Yes or No."
		
			answer = gets.chomp.downcase

			case answer
				when "yes", "y"
					puts ""
					puts "One rather large Goblin steps forward to challenge you..."
					puts ""
					puts "the fight begins"
					puts ""
					Battle.fight_animation
					Battle.fight_animation
					Battle.fight_animation
					monster_type = "Goblin"
					monster_type

				when "no", "n"			
					system('clear')
					puts ""
					puts "You run like a coward, all the way back to town."
					sleep(3)
					10.times { puts ""}
					puts "           -------------------"
					puts "          |  Welcome to town  |"
					puts "           -------------------"
					10.times { puts ""}
					character.character_sheet
					character.update({status: 0})
				else
					puts ""
					puts "What's that?"
					puts ""
					adventure_one(character)
			end
		end

		def adventure_two(character)
			puts ""
			puts ""
			puts "Something is skittering behind you. you swivel around and see KOBOLDS! do you attack? Yes or No."
				
			answer = gets.chomp.downcase

				case answer
				when "yes", "y"
					puts ""
					puts "A kobold doesn't frighten #{character.name}!"
					puts ""
					puts "the fight begins"
					puts ""
					Battle.fight_animation
					Battle.fight_animation
					Battle.fight_animation
					monster_type = "Kobold"
					monster_type

				when "no", "n"			
					system('clear')
					puts ""
					puts "You just ran from a kobold, you're ashamed to return to town."
					sleep(3)
					puts ""
					puts "           -------------------"
					puts "          |  Welcome to town  |"
					puts "           -------------------"
					puts ""
					puts "You are an abject failure. Not just as an adventurer. At life."
					character.character_sheet
					character.update({status: 0})
				else
					puts ""
					puts "What's that?"
					puts ""
					adventure_one(character)
			end
		end

		def adventure_three(character)
			puts ""
			puts ""
			puts "You turn a corner in the dangerous dungeon and see a Hobgoblin standing there, about to attack you."
			puts "He's big and ugly. Do you attack? Yes or no."
				
			answer = gets.chomp.downcase

				case answer
				when "yes", "y"
					puts ""
					puts "You swing your #{character.main_hand} with all your might!"
					puts ""
					puts "the fight begins"
					puts ""
					Battle.fight_animation
					Battle.fight_animation
					Battle.fight_animation
					monster_type = "Hobgoblin"
					monster_type

				when "no", "n"			
					system('clear')
					puts ""
					puts "You run back to town and you realize you were so scared, you started crying."
					puts "For shame!"
					sleep(3)
					puts ""
					puts "           -------------------"
					puts "          |  Welcome to town  |"
					puts "           -------------------"
					puts ""
					puts "When you think about it, Hobgoblins are big and scary. There's no shame in running..."
					puts "You're just not very brave."
					character.character_sheet
					character.update({status: 0})
				else
					puts ""
					puts "What's that?"
					puts ""
					adventure_one(character)
				end
		end

		def adventure_four(character)
			x = rand(1..99)

			case x
				when 1..65
					# HEAL FOUNTAIN
					puts ""
					puts "You come across a fountain bubbling with clear, cool water."
					puts "Do you take a drink?"
					puts ""
					puts "    Yes  |  No"
					answer = gets.chomp.downcase

					case answer
					when "yes", "y"
						new_hp = character.max_hp
						character.update({hit_points:new_hp})
						monster_type = :none
						puts ""
						puts "You feel refreshed!"
						puts ""
						character.character_sheet
						return monster_type
					else
						puts ""
						puts "It's probably wise to avoid drinking from strange fountains in dungeons"
						puts ""
						monster_type = :none
						return monster_type
					end
				when 66..92
					# HARM FOUNTAIN
					puts ""
					puts "You come across a stagnant fountain with murky water"
					puts "You're actually pretty thirsty... Do you take a drink?"
					puts ""
					puts "    Yes  |  No"

					answer = gets.chomp.downcase

					case answer
					when "yes", "y"
						hp = (character.hit_points/2.0).round
						hp = hp.to_i
						character.update({hit_points:hp})
						monster_type = :none
						puts ""
						puts "You don't feel so well..."
						puts ""
						character.character_sheet
						return monster_type
					else
						puts ""
						puts "It's probably wise to avoid drinking from strange fountains in dungeons"
						puts ""
						monster_type = :none
						return monster_type
					end

				when 93..94
					# MAX HP++ FOUNTAIN
					puts ""
					puts "You come across a strange, otherworldly fountain"
					puts "The water has a slightly red hue... Do you take a drink?"
					puts ""
					puts "    Yes  |  No"

					answer = gets.chomp.downcase

					case answer
						when "yes", "y"
						new_max_hp = character.max_hp + 1
						character.update({max_hp:new_max_hp})
						new_hp = character.max_hp
						character.update({hit_points:new_hp})
						monster_type = :none
						puts ""
						puts "You feel different somehow... Maybe even stronger!"
						puts ""
						character.character_sheet
						return monster_type
					else
						puts ""
						puts "It's probably wise to avoid drinking from strange fountains in dungeons"
						puts ""
						monster_type = :none
						return monster_type
					end
				when 95..96
					# +2 STATS FOUNTAIN
					puts ""
					puts "You come across a spring that glows with a magical radiance."
					puts "It's extremely tempting... Do you take a drink?"
					puts ""
					puts "    Yes  |  No"

					answer = gets.chomp.downcase

					case answer
					when "yes", "y"
						y = rand(1..3)
						case y
						when 1
							new_str = character.strength + 2
							character.update({strength:new_str})
							puts ""
							puts "You feel power rushing through your body!"
							puts ""
						character.character_sheet
						when 2
							new_dex = character.dexterity + 2
							character.update({dexterity:new_dex})
							puts ""
							puts "Your sense of alertness feels heightened!"
							puts ""
						character.character_sheet
						when 3
							new_con = character.constitution + 2
							character.update({constitution:new_con})
							new_max_hp = character.max_hp + 1 #add 1 per XP level
							character.update({max_hp:new_max_hp})
							puts ""
							puts "You feel a strange sense of confidence brewing inside you!"
							puts ""
						character.character_sheet
						end
						monster_type = :none
						return monster_type
					else
						puts ""
						puts "It's probably wise to avoid drinking from strange fountains in dungeons"
						puts ""
						monster_type = :none
						return monster_type
					end
				when 96..97
					# CURSED FOUNTAIN
					puts ""
					puts "You come across a fountain"
					puts ""
					puts "You feel strangely drawn to it..."
					puts ""
					puts "It looks delicious... Do you take a drink?"
					puts ""
					puts "    Yes  |  No"

					answer = gets.chomp.downcase

					case answer
					when "yes", "y"
						# -2 to all attributes
						new_str = character.strength - 2
						new_dex = character.dexterity - 2
						new_con = character.constitution - 2
						character.update({strength:new_str})
						character.update({dexterity:new_dex})
						character.update({constitution:new_con})
						new_max_hp = character.max_hp - 1 #subtract 1 per XP level
						character.update({max_hp:new_max_hp})
						character.hit_points > character.max_hp ? character.hit_points = character.max_hp : character.hit_points
						character.update({hit_points:character.hit_points})
						monster_type = :none
						puts ""
						puts "You feel sickened... Could the fountain be cursed?"
						puts ""
						character.character_sheet
						return monster_type
					else
						puts ""
						puts "It's probably wise to avoid drinking from strange fountains in dungeons"
						puts ""
						monster_type = :none
						return monster_type
					end

				when 98..99
					# EXP FOUNTAIN
					puts ""
					puts "You come across an otherwise unremarkable fountain."
					puts "Do you take a drink?"
					puts ""
					puts "    Yes  |  No"

					answer = gets.chomp.downcase

					case answer
					when "yes", "y"
						#+50 experience_total, heals
						new_hp = character.max_hp
						character.update({hit_points:new_hp})
						new_xp = character.experience_total + 20
						character.update({experience_total: new_xp})
						monster_type = :none
						puts ""
						puts "A strange sense of clarity comes over you!"
						puts ""
						character.character_sheet
						return monster_type
					else
						puts ""
						puts "It's probably wise to avoid drinking from strange fountains in dungeons"
						puts ""
						monster_type = :none
						return monster_type
					end
					
			end
		end

		def adventure_five(character)
		
			wep = ["Morning Star", "Axe", "Sword"].sample

			puts ""
			puts "you come across the body of a slain adventurer"
			puts ""
			puts "lying next to the corpse is a #{wep} that seems to be in decent condition"
			puts ""
			puts "Do you pick it up?"
			answer = gets.chomp.downcase

				case answer
				when "yes", "y"
					puts ""
					puts "You enthusiastically grab a hold of your new #{wep}"
					puts ""
					character.update({main_hand:wep})
					character.character_sheet
					monster_type = :none
					return monster_type

				else
					puts ""
					puts "You're happy with your #{character.main_hand}, no reason to switch weapons now..."
					puts ""
					monster_type = :none
					return monster_type
			end							
		end

		x = rand(1..99)

		case x 
		when 1..30
			#goblin
			monster_type = adventure_one(character)
			return monster_type
		when 31..60
			#kobold
			monster_type = adventure_two(character)
			return monster_type
		when 61..75
			#hobgoblin
			monster_type = adventure_three(character)
			return monster_type
		when 76..88
			#fountains
			monster_type = adventure_four(character)
			return monster_type
		else 89..99
			monster_type = adventure_five(character)
			return monster_type
		end
		
	end








		def adventure_six(character)
			
		end

		def adventure_seven(character)
			
		end

		def game_over(character)
			sleep(2)
			system("clear")
			10.times { puts ""}
			puts "                                  _____________                       "
			puts "                                 |             |\\          "
			puts "                                 |   R.I.P     | |           "
			puts "                                |             | |           "
			puts "                                |   #{character.name}        "
			puts "                               |             | |           "
			puts "                               |             | |            "
			puts "                              |             | |           "
			puts "                              |             | |             "
			puts "                            --------------------- "

			8.times { puts ""}
			puts "       #{character.name} fought valiantly and accumulated #{character.experience_total} experience points."
			puts ""
			if character.experience_total > 100
				puts "          #{character.name} will be remembered as one of the most epic adventurers ever."
			elsif character.experience_total > 50
				puts "           #{character.name}'s deeds will be recorded in the annals of history."
			elsif character.experience_total > 25
				puts "       #{character.name} proved a worthy adversary."
			elsif character.experience_total > 10
				puts "                 #{character.name} met an unlucky demise."
			elsif character.experience_total > 1
				puts "       #{character.name} will be remembered for having killed a few kobolds."
			else
				puts "       #{character.name} was probably the worst adventurer that ever lived."
			end
			11.times { puts ""}		
						
			puts "GAME OVER!!!!"
			5.times { puts ""}
			hof = Character.all.max_by(5) do |c|
				c.experience_total
			end
			# hof_name = hof.map do |c|


			# rows = []
			# rows << ['1.', 'One', 1]
			# rows << ['2.', 'Two', 2]
			# rows << ['3.','Three', 3]
			# table = Terminal::Table.new :rows => rows
			# puts "Dungeon Time™ Hall of Fame"
			# puts table

		end

end#class end
