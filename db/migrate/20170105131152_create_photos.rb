class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :imageable_type
      t.integer :imageable_id
      t.integer :tester_id
      t.integer :application_id

      t.timestamps null: false
    end
  end
end
