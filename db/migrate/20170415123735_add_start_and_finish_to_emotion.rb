class AddStartAndFinishToEmotion < ActiveRecord::Migration
  def change
    add_column :emotions, :start, :integer
    add_column :emotions, :finish, :integer
  end
end
