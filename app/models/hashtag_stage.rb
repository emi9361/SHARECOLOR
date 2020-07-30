class HashtagStage < ApplicationRecord
  belongs_to :stage
  belongs_to :hashtag
  validates :stage_id, presence: true
  validates :hashtag_id, presence: true
end
