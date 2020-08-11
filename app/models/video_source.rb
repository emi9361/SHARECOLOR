class VideoSource < ApplicationRecord
	belongs_to :user
	belongs_to :sound
	validates :file, presence: true
	mount_uploader :file, VideoUploader
end
