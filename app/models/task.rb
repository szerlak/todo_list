class Task < ActiveRecord::Base
  has_and_belongs_to_many :users

  has_many :tasks_users
  has_many :creators, -> { TasksUser.where(role: 'Creator') }, through: :tasks_users, class_name: 'User'
  has_many :assignees, -> { TasksUser.where(role: 'Assignee') }, through: :tasks_users, class_name: 'User'

end
