class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :tester_id
      t.string :video_path
      t.integer :application_id

      t.timestamps null: false
    end
  end
end
