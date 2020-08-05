class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sounds, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :stages, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image, destroy: false

  has_many :follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy # 自分からの通知
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy # からの通知

  has_many :video_sources, dependent: :destroy
  has_many :sound_sources, dependent: :destroy

  def self.guest
	  find_or_create_by!(name: 'guest_user', email: 'guest@example.com', location: 'Tokyo', introduction: 'Guest_userです', encrypted_password: 'guest1111') do |user|
	    user.password = SecureRandom.urlsafe_base64
	  end
  end

# ユーザーのフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

# ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

# フォロー人数確認
# include?=性能低下を防ぐために、関連するモデル(follower_user)をあらかじめ取得しておく
  def following?(user)
    following_user.include?(user)
  end

#通知アクション
  def create_notification_follow!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
