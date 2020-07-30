class CreateHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags do |t|
      t.string :hashtag_word

      t.timestamps
    end
     add_index :hashtags, :hashtag_word, unique: true
  end
end
