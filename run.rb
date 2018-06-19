require_relative 'config/environment'

ActiveRecord::Base.logger = nil # comment out if want to see SQL logs

current_character = Game.welcome
current_game = Game.new_game(current_character)
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
