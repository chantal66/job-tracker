require 'rails_helper'

describe 'User sees one tag' do
  scenario 'user can see one tag' do
    tag = Tag.create!(title: 'Ruby on Rails')

    visit tag_path(tag.id)

    expect(current_path).to eq(tag_path(tag.id))
    expect(page).to have_content('Ruby on Rails')
  end

  # scenario 'user sees that tags job' do
  #   company = Company.create(name: 'ESPN')
  #   job = company.jobs.create(title: 'Developer', description: 'Awesome', level_of_interest: 9, city: 'Denver')
  #   tag = Tag.create!(title: 'Ruby on Rails')
  #
  #   visit tag_path(tag.id)
  #
  #   expect(current_path).to eq(tag_path(tag.id))
  #   expect(page).to have_content('Developer at ESPN')
  # end
end