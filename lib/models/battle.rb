class Battle # < ActiveRecord::Base
	# belongs_to :character
	# belongs_to :monster

	#player_attack =rand main_hand.min_damage..main_hand.max_damage
	#monster_attack

	# character and monster are passed in

	def self.attack_damage(attacker)
			min_dam = Weapon.find_by(name:attacker.main_hand).min_damage
			max_dam = Weapon.find_by(name:attacker.main_hand).max_damage
			damage = rand(min_dam..max_dam) + Monster.attribute_bonus(attacker.strength)
			damage
	end

		def self.combat(attacker, defender)
			attacker.class == Character ? level = attacker.level : level = attacker.hit_dice
			attacker.class == Character ? weapon_bonus = Weapon.find_by(name:attacker.main_hand).attack_bonus : weapon_bonus = 0

			if (rand(1..20) + level + Monster.attribute_bonus(attacker.dexterity) + weapon_bonus) >= (3 + defender.armor_value + Monster.attribute_bonus(defender.dexterity))
				damage = attack_damage(attacker)
				damage < 0 ? damage = 0 : damage 
				if defender.class == Character
					new_hp = defender.hit_points - damage
					sleep(1)
					puts "#{attacker.name} does #{damage} damage to #{defender.name}"
					defender.update({hit_points: new_hp})
				else
					new_hp = defender.hit_points - damage
					sleep(1)
					puts "#{attacker.name} does #{damage} damage to #{defender.name}"
					defender.hit_points = new_hp
				end
			else
				puts "#{attacker.name} misses #{defender.name}"
			end

			if defender.hit_points > 0 
				combat(defender, attacker)
			else
				if attacker.class == Character
					puts "#{defender.name} keels over and dies!"
					sleep(2)
					puts "#{attacker.name} wins the battle!"
					if defender.name == "Kobold" || defender.name == "Goblin" || defender.name == "Hobgoblin"
						def_w = defender.main_hand
						att_w = attacker.main_hand
						if def_w != att_w
							puts ""
							puts "The #{defender.name} still grips the #{defender.main_hand} is his cold, dead hand."
							puts ""
							puts "Do you want to pick it up?"
							puts ""
							puts "    Yes  |  No"
							answer = gets.chomp.downcase
							case answer
								when "yes", "y"
									attacker.update({main_hand:defender.main_hand})
								else
							end
						else
						end
					end
					attacker.update({status:1})
					exp = attacker.experience_total + defender.exp_value
					attacker.update({experience_total:exp })
				else
					puts "#{attacker.name} lands a crushing blow to your head..."
					sleep(2)
					defender.update({status:2})
				end
			end

		end
	def self.fight_animation
		system("clear")

		20.times { puts ""}
		puts " ▄▄▄▄    ▄▄▄     ▄▄▄█████▓▄▄▄█████▓ ██▓    ▓█████  ▐██▌ ".green
		puts "▓█████▄ ▒████▄   ▓  ██▒ ▓▒▓  ██▒ ▓▒▓██▒    ▓█   ▀  ▐██▌ ".green
		puts "▒██▒ ▄██▒██  ▀█▄ ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██░    ▒███    ▐██▌ ".green
		puts "▒██░█▀  ░██▄▄▄▄██░ ▓██▓ ░ ░ ▓██▓ ░ ▒██░    ▒▓█  ▄  ▓██▒ ".green
		puts "░▓█  ▀█▓ ▓█   ▓██▒ ▒██▒ ░   ▒██▒ ░ ░██████▒░▒████▒ ▒▄▄  ".green
		puts "░▒▓███▀▒ ▒▒   ▓▒█░ ▒ ░░     ▒ ░░   ░ ▒░▓  ░░░ ▒░ ░ ░▀▀▒ ".green
		puts "▒░▒   ░   ▒   ▒▒ ░   ░        ░    ░ ░ ▒  ░ ░ ░  ░ ░  ░ ".green
		puts " ░    ░   ░   ▒    ░        ░        ░ ░      ░       ░ ".green
		puts " ░            ░  ░                     ░  ░   ░  ░ ░    ".green
		puts "      ░                                                ".green
		sleep(0.2)

		system("clear")

		20.times { puts ""}
		puts " ▄▄▄▄    ▄▄▄     ▄▄▄█████▓▄▄▄█████▓ ██▓    ▓█████  ▐██▌ ".red
		puts "▓█████▄ ▒████▄   ▓  ██▒ ▓▒▓  ██▒ ▓▒▓██▒    ▓█   ▀  ▐██▌ ".red
		puts "▒██▒ ▄██▒██  ▀█▄ ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██░    ▒███    ▐██▌ ".red
		puts "▒██░█▀  ░██▄▄▄▄██░ ▓██▓ ░ ░ ▓██▓ ░ ▒██░    ▒▓█  ▄  ▓██▒ ".red
		puts "░▓█  ▀█▓ ▓█   ▓██▒ ▒██▒ ░   ▒██▒ ░ ░██████▒░▒████▒ ▒▄▄  ".red
		puts "░▒▓███▀▒ ▒▒   ▓▒█░ ▒ ░░     ▒ ░░   ░ ▒░▓  ░░░ ▒░ ░ ░▀▀▒ ".red
		puts "▒░▒   ░   ▒   ▒▒ ░   ░        ░    ░ ░ ▒  ░ ░ ░  ░ ░  ░ ".red
		puts " ░    ░   ░   ▒    ░        ░        ░ ░      ░       ░ ".red
		puts " ░            ░  ░                     ░  ░   ░  ░ ░    ".red
		puts "      ░                                                ".red
		sleep(0.2)

		system("clear")

		20.times { puts ""}
		puts " ▄▄▄▄    ▄▄▄     ▄▄▄█████▓▄▄▄█████▓ ██▓    ▓█████  ▐██▌ ".blue
		puts "▓█████▄ ▒████▄   ▓  ██▒ ▓▒▓  ██▒ ▓▒▓██▒    ▓█   ▀  ▐██▌ ".blue
		puts "▒██▒ ▄██▒██  ▀█▄ ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██░    ▒███    ▐██▌ ".blue
		puts "▒██░█▀  ░██▄▄▄▄██░ ▓██▓ ░ ░ ▓██▓ ░ ▒██░    ▒▓█  ▄  ▓██▒ ".blue
		puts "░▓█  ▀█▓ ▓█   ▓██▒ ▒██▒ ░   ▒██▒ ░ ░██████▒░▒████▒ ▒▄▄  ".blue
		puts "░▒▓███▀▒ ▒▒   ▓▒█░ ▒ ░░     ▒ ░░   ░ ▒░▓  ░░░ ▒░ ░ ░▀▀▒ ".blue
		puts "▒░▒   ░   ▒   ▒▒ ░   ░        ░    ░ ░ ▒  ░ ░ ░  ░ ░  ░ ".blue
		puts " ░    ░   ░   ▒    ░        ░        ░ ░      ░       ░ ".blue
		puts " ░            ░  ░                     ░  ░   ░  ░ ░    ".blue
		puts "      ░                                                ".blue
		sleep(0.2)

		system("clear")

		20.times { puts ""}
		puts " ▄▄▄▄    ▄▄▄     ▄▄▄█████▓▄▄▄█████▓ ██▓    ▓█████  ▐██▌ ".white
		puts "▓█████▄ ▒████▄   ▓  ██▒ ▓▒▓  ██▒ ▓▒▓██▒    ▓█   ▀  ▐██▌ ".white
		puts "▒██▒ ▄██▒██  ▀█▄ ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██░    ▒███    ▐██▌ ".white
		puts "▒██░█▀  ░██▄▄▄▄██░ ▓██▓ ░ ░ ▓██▓ ░ ▒██░    ▒▓█  ▄  ▓██▒ ".white
		puts "░▓█  ▀█▓ ▓█   ▓██▒ ▒██▒ ░   ▒██▒ ░ ░██████▒░▒████▒ ▒▄▄  ".white
		puts "░▒▓███▀▒ ▒▒   ▓▒█░ ▒ ░░     ▒ ░░   ░ ▒░▓  ░░░ ▒░ ░ ░▀▀▒ ".white
		puts "▒░▒   ░   ▒   ▒▒ ░   ░        ░    ░ ░ ▒  ░ ░ ░  ░ ░  ░ ".white
		puts " ░    ░   ░   ▒    ░        ░        ░ ░      ░       ░ ".white
		puts " ░            ░  ░                     ░  ░   ░  ░ ░    ".white
		puts "      ░                                                ".white
		sleep(0.2)
		system("clear")
	end
end




