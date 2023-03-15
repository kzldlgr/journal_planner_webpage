class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_body
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
    add_index :tasks, :user_id
  end
end
