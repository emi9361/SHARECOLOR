class SoundSource < ApplicationRecord
	belongs_to :user
	belongs_to :video
	mount_uploader :file, AudioFileUploader
end
