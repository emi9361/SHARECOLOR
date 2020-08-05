class Notification < ApplicationRecord
	#デフォルトの並び順を「作成日時の降順」で指定
	#(default_scope)新しい通知順を取得できる
	default_scope -> { order(created_at: :desc) }
	#「optional: true」はnil許可
	belongs_to :sound, optional: true
	belongs_to :video, optional: true
	belongs_to :stage, optional: true

	belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
	belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
