class Stage < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	mount_uploader :file, VideoUploader
	attachment :image
	validates :title, presence: true
	validates :file, presence: true
	validate :video_size
	has_many :hashtag_stages, dependent: :destroy
	has_many :hashtags, through: :hashtag_stages
	has_many :notifications, dependent: :destroy


	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	#動画容量制限
	def video_size
		if file.size > 50.megabytes
		errors.add(:file, "should be less than 100MB")
		end
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
		tag = Hashtag.find_or_create_by(hashtag_word: hashtag.downcase.delete('#'))
		stage.hashtags << tag
	    end
	end

	def create_notification_like!(current_user)
	# すでに「いいね」されているか検索
			temp = Notification.where(["visitor_id = ? and visited_id = ? and stage_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
	# いいねされていない場合のみ、通知レコードを作成
		if temp.blank?
			notification = current_user.active_notifications.new(
			stage_id: id,
			visited_id: user_id,
			action: 'like'
			)
	# 自分の投稿に対するいいねの場合は、通知済みとする
		if notification.visitor_id == notification.visited_id
		notification.checked = true
		end
		notification.save if notification.valid?
		end
	end

	def Stage.search(search)
		Stage.where(['title LIKE ?', "%#{search}%"])
	end

end
