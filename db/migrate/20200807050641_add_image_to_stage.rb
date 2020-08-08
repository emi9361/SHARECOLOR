class AddImageToStage < ActiveRecord::Migration[5.2]
  def change
    add_column :stages, :image_id, :string
  end
end
