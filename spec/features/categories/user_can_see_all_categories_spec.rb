require 'rails_helper'

describe 'User sees all categories' do
  scenario 'a user sees all categories' do
    category = Category.create!(title: 'Ruby')
    category2 = Category.create!(title: 'Testing')

    visit categories_path

    expect(page).to have_content('Ruby')
    expect(page).to have_content('Testing')
  end
end