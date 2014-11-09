require 'rails_helper'

def login
	visit (root_path)
	expect(page).to have_content('Log in')
	fill_in('Email', :with => 'email@email.com')
	fill_in('Password', :with => 'password')
	click_button('Log in')
	expect(page).to have_content('Users#show')
end

def prepare_user
	u = User.create(email: "email@email.com", password: "password")
	Task.create(user: u, title: "title", description: "tralalala", finished: false)
end

def go_to_edit_task_page
	click_link('Tasks')
	expect(page).to have_content('Task#index')
	click_link('Edit')
	expect(page).to have_content('Task#edit')
end

describe 'edit task' do
	before do
		prepare_user
		login
	end

	it do
	    go_to_edit_task_page 
		fill_in('Title', :with => 'changed')
		fill_in('Description', :with => 'another description')
	    check('Finished')
	    click_button('Update Task')
	    current_path.should == "/users/1/tasks"
	    expect(page).to have_content('changed')
        expect(page).to have_content('another description')
        expect(page).to have_content('true')
	end	
end