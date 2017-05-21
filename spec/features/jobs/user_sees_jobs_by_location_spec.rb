require 'rails_helper'

describe 'User sees jobs by location' do
  scenario  'a user sees all jobs by location' do
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer', level_of_interest: '8', city: 'Denver')
    company.jobs.create!(title: 'Tester', level_of_interest: '6', city: 'New York')
    company.jobs.create!(title: 'Software Developer', level_of_interest: '10', city: 'Denver')

    company2 = Company.create!(name: 'Google')
    company2.jobs.create!(title: 'Web Developer', level_of_interest: '4', city: 'New York')
    company2.jobs.create!(title: 'Data Scientist', level_of_interest: '8', city: 'Denver')

    company3 = Company.create!(name: 'Turing')
    company3.jobs.create!(title: 'Instructor', level_of_interest: '3', city: 'Denver')

    visit "/jobs?sort=location"

    expect(page).to have_content('Jobs by Location')
    expect(page.find('tr:nth-child(2)')).to have_content('Denver Developer at ESPN')
    expect(page.find('tr:nth-child(3)')).to have_content('Denver Software Developer at ESPN')
    expect(page.find('tr:nth-child(4)')).to have_content('Denver Data Scientist at Google')
    expect(page.find('tr:nth-child(5)')).to have_content('Denver Instructor at Turing')
    expect(page.find('tr:nth-child(6)')).to have_content('New York Tester at ESPN')
    expect(page.find('tr:nth-child(7)')).to have_content('New York Web Developer at Google')
  end
end