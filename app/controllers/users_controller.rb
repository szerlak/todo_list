class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @count = current_user.tasks.count
  end

end
