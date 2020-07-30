class CreateHashtagStages < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_stages do |t|
      t.references :stage, foreign_key: true
      t.references :hashtag, foreign_key: true


      t.timestamps
    end
  end
end
