Weapon.create(name: "Club", min_damage: 1, max_damage: 4, armor_value: 0, attack_bonus: 0)
Weapon.create(name: "Dagger", min_damage: 2, max_damage: 3, armor_value: 0, attack_bonus: 0)
Weapon.create(name: "Sword", min_damage: 1, max_damage: 8, armor_value: 0, attack_bonus: 0)
Weapon.create(name: "Axe", min_damage: 2, max_damage: 7, armor_value: 0, attack_bonus: 0)
Weapon.create(name: "Goblin Club", min_damage: 1, max_damage: 4, armor_value: 0, attack_bonus: 0)
Weapon.create(name: "Kobold Spear", min_damage: 1, max_damage: 4, armor_value: 0, attack_bonus: 0)
Weapon.create(name: "Morning Star", min_damage: 1, max_damage: 6, armor_value: 0, attack_bonus: 0)
Weapon.create(name: "Ogre Club", min_damage: 2, max_damage: 12, armor_value: 0, attack_bonus: 0)
Weapon.create(name: "Giant Club", min_damage: 3, max_damage: 18, armor_value: 0, attack_bonus: 0)
Weapon.create(name: "Dragon Breath", min_damage: 2, max_damage: 16, armor_value: 0, attack_bonus: 0)
Weapon.create(name: "+1 Sword", min_damage: 2, max_damage: 9, armor_value: 0, attack_bonus: 1)
Weapon.create(name: "Rusty Sword", min_damage: 0, max_damage: 6, armor_value: 0, attack_bonus: 0)

Monster.create(name: "Goblin", strength: 8, dexterity: 12, constitution: 8, hit_dice: 1, armor_value: 0, main_hand: Weapon.find_by(id: 5).name, exp_value: 3)
Monster.create(name: "Kobold", strength: 6, dexterity: 10, constitution: 7, hit_dice: 1, armor_value: 1, main_hand: Weapon.find_by(id: 6).name, exp_value: 1)
Monster.create(name: "Hobgoblin", strength: 14, dexterity: 10, constitution: 14, hit_dice: 1, armor_value: 1, main_hand: Weapon.find_by(id: 7).name, exp_value: 5)
Monster.create(name: "Ogre", strength: 18, dexterity: 8, constitution: 16, hit_dice: 4, armor_value: 3, main_hand: Weapon.find_by(id: 8).name, exp_value: 11)
Monster.create(name: "Hill Giant", strength: 20, dexterity: 10, constitution: 18, hit_dice: 7, armor_value: 5, main_hand: Weapon.find_by(id: 9).name, exp_value: 24)
Monster.create(name: "Hatchling Dragon", strength: 16, dexterity: 10, constitution: 16, hit_dice: 8, armor_value: 8, main_hand: Weapon.find_by(id: 10).name, exp_value: 32)

# Armor.create(name: "cloth", armor_value: 1)
# Armor.create(name: "leather", armor_value: 3)
# Armor.create(name: "chainmail", armor_value: 5)
# Armor.create(name: "plate", armor_value: 7)



