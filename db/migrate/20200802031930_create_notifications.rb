class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
    	#idのところはnilに出来ないよう制約する
    	t.integer :visitor_id, null: false
    	t.integer :visited_id, null: false
        t.integer :sound_id
        t.integer :video_id
        t.integer :stage_id
    	#action確認したかどうかの初期値はfalse(通知未確認)に設定
    	t.string :action, default:'',null: false
    	t.boolean :checked, default: false, null: false

      t.timestamps
    end
    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :sound_id
    add_index :notifications, :video_id
    add_index :notifications, :stage_id
  end
end
