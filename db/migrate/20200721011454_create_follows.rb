class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.string :following
      t.string :follower

      t.timestamps
    end
  end
end
