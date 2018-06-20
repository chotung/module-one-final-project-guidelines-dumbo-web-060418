class Character < ActiveRecord::Base
	belongs_to :player
	belongs_to :game
	has_one :character_sheet
	has_many :weapons
	# has_many :battles

	def self.character_setup(player)
		puts "Enter a character name"
		name1 = gets.chomp
		current_character = Character.create(name:name1, player_id: player.id)
		sleep(1)
		puts "roll 3d6 for strength"
		sleep(1)
			# strength
		str_total = current_character.roll_attributes
		current_character.update({strength: str_total})
		str_bonus = current_character.attribute_bonus(str_total)
		sleep(1)
		puts "roll 3d6 for dexterity"
		sleep(1)
			# dexterity
		dex_total = current_character.roll_attributes
		current_character.update({dexterity: dex_total})
		dex_bonus = current_character.attribute_bonus(dex_total)
		sleep(1)
			# constitution
		puts "roll 3d6 for constitution"
		sleep(1)
		con_total = current_character.roll_attributes
		current_character.update({constitution: con_total})
		con_bonus = current_character.attribute_bonus(con_total)
			# hit points
		puts "roll 1d8 for hit points"
		sleep(1)
		base_hp = current_character.roll_hit_points
		hit_points = current_character.calculate_hit_points(con_bonus, base_hp)
		hit_points < 1 ? hit_points = 1 : hit_points
		sleep(1)
		puts "#{name1} has #{hit_points} HP (adjusted by #{con_total} Constitution)"
		current_character.update({hit_points: hit_points})
		current_character.update({max_hp: hit_points})
		total_armor_bonus = current_character.calculate_total_armor_bonus(dex_bonus, current_character.armor_value)
		armor_class = current_character.calculate_armor_class(total_armor_bonus)
		# weapon = "NONE"
		# armor = "NONE"
		# sheet = current_character.character_sheet(name1, hit_points, armor_class, str_total, dex_total, con_total, str_bonus, dex_bonus, con_bonus, weapon, armor )
		# sheet

		current_character.character_sheet
		current_character
	end



	def roll_attributes
		tot = rand(6) + 1
		tot += rand(6) + 1
		tot += rand(6) +1
		puts tot
		tot
	end

	def roll_hit_points
		tot = rand(8)+1
		puts tot
		tot
	end

	def attribute_bonus(attribute)
		if attribute >= 18
			bonus = 4
		elsif attribute >= 16
			bonus = 3
		elsif attribute >= 14
			bonus = 2
		elsif attribute >= 12
			bonus = 1		
		elsif attribute >= 10
			bonus = 0
		elsif attribute >= 8
			bonus = -1
		elsif attribute >= 6
			bonus = -2
		elsif attribute >= 4
			bonus = -3
		else
			bonus = -4
		end
		bonus
	end

	def calculate_hit_points(bonus, base_hp)
		hp = base_hp + bonus
		hp	
	end

	def calculate_total_armor_bonus(dex_bonus, armor_bonus)
		tab = dex_bonus + armor_bonus
		tab
	end


	def calculate_armor_class(total_armor_bonus)
		ac = 10 - total_armor_bonus
		ac
	end

	def character_sheet
		hp = self.hit_points
		str_total = self.strength
		str_bonus = attribute_bonus(str_total)
		dex_total = self.dexterity
		dex_bonus = attribute_bonus(dex_total)
		con_total = self.constitution
		con_bonus = attribute_bonus(con_total)
		name1 = self.name
		armor_class = calculate_armor_class(self.armor_value)
		weapon = self.main_hand
		armor = "NONE"

		puts "___________________________________________"
		puts "|#{name1}"
		puts "|                                          |"
		puts "| HP :  #{hp}                                  |"
		puts "|                                          |"
		print "| ARMOR CLASS : #{armor_class}"
		if armor_class > 9
			puts"                         |"
		else
			puts"                          |"
		end
		puts "|                                          |"
		puts "| STR #{str_total}  : #{str_bonus}                              |"
		puts "|                                          |"
		puts "| DEX #{dex_total}  : #{dex_bonus}                              |"
		puts "|                                          |"
		puts "| CON #{con_total}  : #{con_bonus}                              |"
		puts "|                                          |"
		puts "| WEAPON : #{weapon}                            |"
		puts "|                                          |"
		puts "| ARMOR : #{armor}                             |"
		puts "|                                          |"
		puts "____________________________________________"	
		
	end
end