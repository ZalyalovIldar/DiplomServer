class CreateTesters < ActiveRecord::Migration
  def change
    create_table :testers do |t|
      t.string :name
      t.string :descriptions
      t.integer :aplication_id

      t.timestamps null: false
    end
  end
end
