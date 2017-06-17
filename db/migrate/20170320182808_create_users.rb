class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :encrypted_password
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
