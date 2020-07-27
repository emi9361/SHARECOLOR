class Hashtag < ApplicationRecord
	validates :hashtag_word, presence: true, length: { maximum: 100 }
	has_many :hashtag_sounds, dependent: :destroy
	has_many :sounds, through: :hashtag_sounds
end
