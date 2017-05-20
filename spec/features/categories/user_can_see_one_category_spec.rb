require 'rails_helper'

describe 'User see one category ' do
  scenario  'a user can see one category' do
    category = Category.create!(title: 'Testing')

    visit category_path(category.id)

    expect(current_path).to eq(category_path(category.id))
    expect(page).to have_content('Testing')
  end

  scenario "a user sees the categories's jobs" do
    category = Category.create!(title: 'Developer')
    company = Company.create(name: 'Diamond Back')

    company.jobs.create!(title: "Developer", level_of_interest: 5, city: "Denver", category_id: category.id)
    company.jobs.create!(title: "UX Designer", level_of_interest: 8, city: "Littleton", category_id: category.id)

    visit category_path(category.id)

    expect(current_path).to eq(category_path(category.id))
    expect(page).to have_content('Developer at Diamond Back')
    expect(page).to have_content('UX Designer at Diamond Back')
  end
end