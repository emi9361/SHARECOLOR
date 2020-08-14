class VideoSource < ApplicationRecord
	belongs_to :user
	belongs_to :sound
	validates :file, presence: true
	validate :video_size
	mount_uploader :file, VideoUploader

	#動画容量制限
	def video_size
		if file.size > 50.megabytes
		errors.add(:file, "should be less than 50MB")
		end
	end

end
