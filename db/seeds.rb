Weapon.create(name: "Club", min_damage: 1, max_damage: 6, armor_value: 0)
Weapon.create(name: "Dagger", min_damage: 1, max_damage: 4, armor_value: 0)
Weapon.create(name: "Sword", min_damage: 1, max_damage: 8, armor_value: 0)
Weapon.create(name: "Axe", min_damage: 2, max_damage: 7, armor_value: 0)
Weapon.create(name: "Spear", min_damage: 2, max_damage: 5, armor_value: 0)


Monster.create(name: "Goblin", strength: 8, dexterity: 12, constitution: 8, hit_dice: 1, armor_value: 0)
Monster.create(name: "Kobold", strength: 6, dexterity: 10, constitution: 7, hit_dice: 1, armor_value: 1)
Monster.create(name: "Hobgoblin", strength: 14, dexterity: 10, constitution: 16, hit_dice: 1, armor_value: 0)
Monster.create(name: "Ogre", strength: 18, dexterity: 8, constitution: 16, hit_dice: 4, armor_value: 0)
Monster.create(name: "Hill Giant", strength: 20, dexterity: 10, constitution: 18, hit_dice: 7, armor_value: 5)
Monster.create(name: "Hatchling Dragon", strength: 16, dexterity: 10, constitution: 16, hit_dice: 8, armor_value: 8)


# def roll_attribute
#   tot = rand(6) + 1
#   tot += rand(6) + 1
#   tot += rand(6) +1
#   puts tot
# end

# def strength_bonus
# 	if :strength >= 18
# 		bonus = 4
# 	elsif :strength >= 16
# 		bonus = 3
# 	elsif :strength >= 14
# 		bonus = 2
# 	elsif :strength >= 12
# 		bonus = 1		
# 	elsif :strength >= 10
# 		bonus = 0
# 	elsif :strength >= 8
# 		bonus = -1
# 	elsif :strength >= 6
# 		bonus = -2
# 	elsif :strength >= 4
# 		bonus = -3
# 	else
# 		bonus = -4
# 	end
# end
