require_relative 'config/environment'

ActiveRecord::Base.logger = nil # comment out if want to see SQL logs

current_character = Game.welcome
current_game = Game.new_game(current_character)
<<<<<<< HEAD
current_game.weapon_choice
=======
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
>>>>>>> 10b79d2a59d1c82dd6156fd3768dea4d27cd564e
