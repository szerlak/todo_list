class CreateTasksUsers < ActiveRecord::Migration
  def change
    create_table :tasks_users do |t|
      t.references :user, index: true
      t.references :task, index: true

      t.timestamps
    end
  end
end
