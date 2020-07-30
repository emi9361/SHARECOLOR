class CreateSounds < ActiveRecord::Migration[5.2]
  def change
    create_table :sounds do |t|
      t.integer :user_id
      t.string :genre
      t.string :mood
      t.text :hashbody
      t.string :file
      t.string :bpm
      t.string :title
      t.string :detail


      t.timestamps
    end
  end
end
