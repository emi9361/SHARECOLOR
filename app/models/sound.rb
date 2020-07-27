class Sound < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	mount_uploader :file, AudioFileUploader
	validates :title, presence: true
	validates :file, presence: true
	has_many :hashtag_sounds, dependent: :destroy
	has_many :hashtags, through: :hashtag_sounds

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	after_create do
		sound = Sound.find_by(id: id)
		# hashtitleに入力したハッシュタグを検出
		hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
		hashtags.uniq.map do |hashtag|
		# ハッシュタグ先頭の#を外した上で保存
		tag = Hashtag.find_or_create_by(hashtag_word: hashtag.downcase.delete('#'))
		sound.hashtags << tag
		end
	end

	#更新
	before_update do
		sound = Sound.find_by(id: id)
		#更新したらhashtagを消す
		sound.hashtags.clear
		hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
		#map繰り返しで複数のhashtagがsoundに保存される
		hashtags.uniq.map do |hashtag|
		tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
    	post_image.hashtags << tag
		end
  	end


 end
