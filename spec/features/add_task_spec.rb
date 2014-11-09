require 'rails_helper'

describe 'add task to user' do
  let(:authed_user) { create_logged_in_user }

  before do
    authed_user.tasks.create(title: 'First', description: 'First', finished: false)
  end

  it do
    visit root_path
    expect(page).to have_content 'Count: 1'

    click_link 'New task'
    expect(current_path).to eq new_user_task_path(authed_user)

    fill_in 'Title', with: 'Second'
    fill_in 'Description', with: 'Second'
    check 'Finished'
    click_button 'Create Task'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Count: 2'
  end
end