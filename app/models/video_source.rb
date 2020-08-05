class VideoSource < ApplicationRecord
	belongs_to :user
	belongs_to :sound
	mount_uploader :file, VideoUploader
end
