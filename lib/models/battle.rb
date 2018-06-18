class Battle < ActiveRecord::Base
	belongs_to :character
	belongs_to :monster
end