require 'rails_helper'

describe 'User deletes existing category' do
  scenario 'user can delete a category' do
    category =Category.create!(title: 'Testing')

    visit categories_path
    click_link 'Delete'

    expect(page).to_not have_content('Testing')
  end
end