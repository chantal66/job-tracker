require 'rails_helper'

describe 'User sees all tags' do
  scenario  'a user sees all the tags' do
    tag = Tag.create!(title: 'Ruby on Rails')
    tag1 = Tag.create!(title: 'Javascript')

    visit tags_path(tag)

    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('Javascript')
  end
end