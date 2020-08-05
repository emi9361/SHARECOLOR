class CreateSoundSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sound_sources do |t|
      t.integer :user_id
      t.integer :video_id
      t.string :file

      t.timestamps
    end
  end
end
