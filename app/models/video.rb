class Video < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	mount_uploader :file, VideoUploader
	validates :title, presence: true
	validates :file, presence: true
	has_many :hashtag_videos, dependent: :destroy
	has_many :hashtags, through: :hashtag_videos
	has_many :notifications, dependent: :destroy
	has_many :sound_sources, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	after_create do
		video = Video.find_by(id: id)
		# hashbodyに入力したハッシュタグを検出
		hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
		hashtags.uniq.map do |hashtag|
		# ハッシュタグ先頭の#を外した上で保存
		tag = Hashtag.find_or_create_by(hashtag_word: hashtag.downcase.delete('#'))
		video.hashtags << tag
		end
	end

	#更新
	before_update do
		video = Video.find_by(id: id)
		#更新したらhashtagを消す
		video.hashtags.clear
		hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
		#map繰り返しで複数のhashtagがsoundに保存される
		hashtags.uniq.map do |hashtag|
		tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
    	video.hashtags << tag
		end
  	end

  	def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and video_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        video_id: id,
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

end
