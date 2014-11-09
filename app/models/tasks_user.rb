class TasksUser < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  belongs_to :creator, foreign_key: 'user_id'
  belongs_to :assignee, foreign_key: 'user_id'
end
