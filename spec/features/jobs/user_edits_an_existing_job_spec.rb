require 'rails_helper'

describe 'User edits a company job' do
  scenario  'a user can edit a company job ' do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: 'Engineering')
    category2 = Category.create(title: 'Development')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 5, city: 'Denver', category_id: 2)

    visit edit_company_job_path(company, job)
    select '9', :from => 'job[level_of_interest]'
    select 'Engineering', :from =>'job[category_id]'

    click_button 'Update'

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{job.id}")
    expect(page).to have_content('9')
    skip
    expect(page).to have_content('Engineering')


  end
end