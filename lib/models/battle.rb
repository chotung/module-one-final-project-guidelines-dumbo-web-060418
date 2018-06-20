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

			if defender.hit_points > 0 
				combat(defender, attacker)
			else
				if attacker.class == Character
					puts "#{defender.name} keels over and dies!"
					sleep(2)
					puts "#{attacker.name} wins the battle!"
					encounter_result = "alive"
				else
					puts "#{attacker.name} lands a crushing blow to your head..."
					sleep(2)
					puts "You are dead."
					encounter_result = "dead"
				end
			end
		end
end


