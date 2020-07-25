class Sound < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	mount_uploader :file, AudioFileUploader
	validates :title, presence: true
	validates :file, presence: true 
	def favorited_by?(user)
		favorite.where(user_id: user.id).exists?
	end
end
