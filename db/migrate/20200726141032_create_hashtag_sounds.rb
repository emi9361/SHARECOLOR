class CreateHashtagSounds < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_sounds do |t|
      t.references :sound, foreign_key: true
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
  end
end
