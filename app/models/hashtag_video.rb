class HashtagVideo < ApplicationRecord
  belongs_to :video
  belongs_to :hashtag
  validates :video_id, presence: true
  validates :hashtag_id, presence: true
end
