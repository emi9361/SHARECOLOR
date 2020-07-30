class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :sound ,optional: true
	belongs_to :video ,optional: true
	belongs_to :stage ,optional: true

end
