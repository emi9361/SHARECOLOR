class CreateHashtagVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_videos do |t|
      t.references :video, foreign_key: true
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
  end
end
