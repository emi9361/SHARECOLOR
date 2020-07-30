class Hashtag < ApplicationRecord
	validates :hashtag_word, presence: true, length: { maximum: 100 }
	has_many :hashtag_sounds, dependent: :destroy
	has_many :hashtag_videos, dependent: :destroy
	has_many :hashtag_stages, dependent: :destroy
	has_many :sounds, through: :hashtag_sounds
	has_many :videos, through: :hashtag_videos
	has_many :stages, through: :hashtag_stages
end
