class AddVideoIdToEmotions < ActiveRecord::Migration
  def change
    add_column :emotions, :video_id, :integer
  end
end
