class AddRoleToTasksUsers < ActiveRecord::Migration
  def change
    add_column :tasks_users, :role, :string, index: true
  end
end
