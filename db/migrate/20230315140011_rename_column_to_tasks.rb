class RenameColumnToTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :user_id, :category_id
  end
end
