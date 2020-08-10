class HashtagSound < ApplicationRecord
	belongs_to :sound
	belongs_to :hashtag
	validates :sound_id, presence: true
	validates :hashtag_id, presence: true
end
