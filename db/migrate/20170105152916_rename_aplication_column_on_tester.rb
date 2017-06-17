class RenameAplicationColumnOnTester < ActiveRecord::Migration
  def change
    rename_column :testers, :aplication_id, :application_id
  end
end
