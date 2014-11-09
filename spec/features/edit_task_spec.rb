require 'rails_helper'


def create_task
	user = create_logged_in_user
	Task.create(user: user, title: "title", description: "tralalala", finished: false)

end

def go_to_edit_task_page
	visit(root_path)
	click_link('Tasks')
	expect(page).to have_content('Task#index')
	click_link('Edit')
	expect(page).to have_content('Task#edit')
end

describe 'edit task' do
	before do
		create_task
	end

	it do
	    go_to_edit_task_page 
		fill_in('Title', :with => 'changed')
		fill_in('Description', :with => 'another description')
	    check('Finished')
	    click_button('Update Task')
	    expect(current_path).to eq("/users/1/tasks")
	    expect(page).to have_content('changed')
        expect(page).to have_content('another description')
        expect(page).to have_content('true')
	end	
end