class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.string :genre
      t.string :mood
      t.string :hashtag
      t.string :file
      t.string :title
      t.string :detail

      t.timestamps
    end
  end
end
