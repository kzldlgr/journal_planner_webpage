class AddNewColumnFromTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :status, :string, null:false, default: 'pending'
  end
end
