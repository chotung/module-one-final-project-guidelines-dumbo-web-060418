class Character < ActiveRecord::Base
	belongs_to :player
	has_many :weapons
	has_many :battles
end