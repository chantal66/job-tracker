require 'rails_helper'

describe 'User sees jobs by interest level' do
  scenario 'a user sees all jobs by interest' do
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer', level_of_interest: '8', city: 'Denver')
    company.jobs.create!(title: 'Tester', level_of_interest: '6', city: 'New Jersey')
    company.jobs.create!(title: 'Software Developer', level_of_interest: '10', city: 'Denver')

    company2 = Company.create!(name: 'Google')
    company2.jobs.create!(title: 'Web Developer', level_of_interest: '9', city: 'New York')
    company2.jobs.create!(title: 'Data Scientist', level_of_interest: '8', city: 'Denver')

    company3 = Company.create!(name: 'Turing')
    company3.jobs.create!(title: 'Instructor', level_of_interest: '6', city: 'Denver')

    visit '/jobs?sort=interest'

    expect(page).to have_content('Jobs by Level of Interest')
    expect(page).to have_content('10 Software Developer at ESPN')
    expect(page).to have_content('9 Web Developer at Google')
    expect(page).to have_content('8 Data Scientist at Google')
    expect(page).to have_content('6 Instructor at Turing')

  end
end