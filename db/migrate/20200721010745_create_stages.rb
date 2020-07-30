class CreateStages < ActiveRecord::Migration[5.2]
  def change
    create_table :stages do |t|
      t.integer :user_id
      t.string :genre
      t.text :hashbody
      t.string :file
      t.string :title
      t.string :detail

      t.timestamps
    end
  end
end
