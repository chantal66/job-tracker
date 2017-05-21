require 'rails_helper'

describe 'User sees dashboard trends' do
  scenario 'user sees all jobs and company metrics' do
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer', level_of_interest: '8', city: 'Denver')
    company.jobs.create!(title: 'Tester', level_of_interest: '6', city: 'New York')
    company.jobs.create!(title: 'Software Developer', level_of_interest: '10', city: 'Denver')

    company2 = Company.create!(name: 'Google')
    company2.jobs.create!(title: 'Web Developer', level_of_interest: '4', city: 'New York')
    company2.jobs.create!(title: 'Data Scientist', level_of_interest: '8', city: 'Denver')

    company3 = Company.create!(name: 'Turing')
    company3.jobs.create!(title: 'Instructor', level_of_interest: '3', city: 'Denver')

    visit dashboard_path

    expect(page).to have_content('Top Companies by Level of Interest')
    within(".company-interest") do
      expect(page.find('tr:nth-child(2)')).to have_content('ESPN')
      expect(page.find('tr:nth-child(3)')).to have_content('Google')
      expect(page.find('tr:nth-child(4)')).to have_content('Turing')
    end

    expect(page).to have_content('Number of Jobs by level of Interest')
    within('.job-interest') do
      expect(page).to have_content('8 2')
      expect(page).to have_content('4 1')
      expect(page).to have_content('3 1')
      expect(page).to have_content('10 1')
      expect(page).to have_content('6 1')
    end

    expect(page).to have_content('Number of Jobs by Location')
    within('.job-location') do
      expect(page).to have_content('Denver 4')
      expect(page).to have_content('New York 2')
    end
  end

end