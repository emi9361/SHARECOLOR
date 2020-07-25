class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :sound
	belongs_to :video
	belongs_to :stage

end
