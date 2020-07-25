class Stage < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	mount_uploader :file, VideoUploader

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
