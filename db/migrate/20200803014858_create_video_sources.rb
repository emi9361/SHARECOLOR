class CreateVideoSources < ActiveRecord::Migration[5.2]
  def change
    create_table :video_sources do |t|
      t.integer :user_id
      t.integer :sound_id
      t.string :file

      t.timestamps
    end
  end
end
