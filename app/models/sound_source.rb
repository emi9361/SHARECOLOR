class SoundSource < ApplicationRecord
	belongs_to :user
	belongs_to :video
	mount_uploader :file, AudioFileUploader
	validates :file, presence: true
end
