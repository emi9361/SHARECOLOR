class SoundSource < ApplicationRecord
	belongs_to :user
	belongs_to :video
	mount_uploader :file, AudioFileUploader
	validates :file, presence: true
	validate :sound_size

		#音声容量制限
	def sound_size
		if file.size > 5.megabytes
		errors.add(:file, "should be less than 5MB")
		end
	end

end
