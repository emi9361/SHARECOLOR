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

  def self.guest
	  find_or_create_by!(email: 'guest@example.com') do |user|
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
    follower_user.include?(user)
  end
end
