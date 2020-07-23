class CreateSounds < ActiveRecord::Migration[5.2]
  def change
    create_table :sounds do |t|
      t.integer :user_id
      t.integer :genre_id
      t.integer :mood_id
      t.integer :hashtag_id
      t.string :sound_source
      t.string :bpm
      t.string :title
      t.string :detail


      t.timestamps
    end
  end
end
