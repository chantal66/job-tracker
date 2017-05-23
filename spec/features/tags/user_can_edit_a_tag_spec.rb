require 'rails_helper'

describe 'User edits an existing tag' do
  scenario 'user can edit a tag' do
    tag = Tag.create!(title: 'Ruby')

    visit edit_tag_path(tag)

    fill_in 'tag[title]', with: 'Ruby on Rails'

    click_button 'Update'

    expect(current_path).to eq('/tags')
    expect(page).to have_content('Ruby on Rails')
  end
end