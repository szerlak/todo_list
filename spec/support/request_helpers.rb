require 'spec_helper'
include Warden::Test::Helpers

module RequestHelpers
  def create_logged_in_user
    # user = Factory(:user)
    user = User.create(email: 'admin@admin.pl', password: 'qwerty123')
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end
end