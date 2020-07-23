class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :sound_id
	belongs_to :video_id
	belongs_to :stage_id

end
