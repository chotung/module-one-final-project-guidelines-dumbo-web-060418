class CharacterSheet < ActiveRecord::Base
	belongs_to :character
	
	name1 = current_character.name
	hit_points = current_character
	armor_class
	str_total
	dex_total
	con_total
	str_bonus
	dex_bonus
	con_bonus
	weapon
	armor = "NONE"
	# 	puts "___________________________________________"
	# 	puts "|#{name1}"
	# 	puts "|                                          |"
	# 	puts "| HP :  #{hit_points}                                  |"
	# 	puts "|                                          |"
	# 	print "| ARMOR CLASS : #{armor_class}"
	# 	if armor_class > 9
	# 		puts"                         |"
	# 	else
	# 		puts"                          |"
	# 	end
	# 	puts "|                                          |"
	# 	puts "| STR #{str_total}  : #{str_bonus}                              |"
	# 	puts "|                                          |"
	# 	puts "| DEX #{dex_total}  : #{dex_bonus}                              |"
	# 	puts "|                                          |"
	# 	puts "| CON #{con_total}  : #{con_bonus}                              |"
	# 	puts "|                                          |"
	# 	puts "| WEAPON : #{weapon}                            |"
	# 	puts "|                                          |"
	# 	puts "| ARMOR : #{armor}                             |"
	# 	puts "|                                          |"
	# 	puts "____________________________________________"	
		
	# end
end
