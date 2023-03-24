class RenameColumnForTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :deadline, :end_time
    add_column :tasks, :start_time, :datetime

  end
end
