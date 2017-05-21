require 'rails_helper'

describe 'User sees jobs in a specific city' do
  scenario  'a user sees all jobs in Denver' do
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer', level_of_interest: '8', city: 'Denver')
    company.jobs.create!(title: 'Tester', level_of_interest: '6', city: 'New Jersey')
    company.jobs.create!(title: 'Software Developer', level_of_interest: '10', city: 'Denver')

    company2 = Company.create!(name: 'Google')
    company2.jobs.create!(title: 'Web Developer', level_of_interest: '4', city: 'New York')
    company2.jobs.create!(title: 'Data Scientist', level_of_interest: '8', city: 'Denver')

    company3 = Company.create!(name: 'Turing')
    company3.jobs.create!(title: 'Instructor', level_of_interest: '3', city: 'Denver')

    visit '/jobs?location=Denver'

    expect(page).to have_content('Jobs in Denver')
    expect(page).to have_content('Developer at ESPN')
    expect(page).to have_content('Software Developer at ESPN')
    expect(page).to have_content('Data Scientist at Google')
    expect(page).to have_content('Instructor at Turing')

  end
end