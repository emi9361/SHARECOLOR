class Stage < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	mount_uploader :file, VideoUploader
	validates :title, presence: true
	validates :file, presence: true
	has_many :hashtag_stages, dependent: :destroy
	has_many :hashtags, through: :hashtag_stages


	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	after_create do
		stage = Stage.find_by(id: id)
		# hashbodyに入力したハッシュタグを検出
		hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
		hashtags.uniq.map do |hashtag|
		tag = Hashtag.find_or_create_by(hashtag_word: hashtag.downcase.delete('#'))
		stage.hashtags << tag
		end
end

	before_update do
		stage = Stage.find_by(id: id)
		stage.hashtags.clear
		hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
		#map繰り返しで複数のhashtagがsoundに保存される
		hashtags.uniq.map do |hashtag|
		tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
		stage.hashtags << tag
	    end
	end
end