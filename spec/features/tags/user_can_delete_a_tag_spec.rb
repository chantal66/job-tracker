require 'rails_helper'

describe 'User can delete a tag' do
  scenario 'a user can delete a tag' do
    Tag.create!(title: 'Ruby on Rails')

    visit tags_path

    click_link 'Delete'

    expect(page).to_not have_content('Ruby on Rails')
  end
end