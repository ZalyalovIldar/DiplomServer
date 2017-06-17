class ChangeVideoColumn < ActiveRecord::Migration
  def change
    rename_column :videos, :video_path, :data
    change_column :videos, :data, :text
  end
end
