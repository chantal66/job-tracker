require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: 'Engineering')
    category2 = Category.create(title: 'Development')

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    select '5', :from => "job[level_of_interest]"
    fill_in "job[city]", with: "Denver"
    select 'Engineering', :from => 'job[category_id]'

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("5")
    expect(page).to have_content("Denver")
    # expect(page).to have_content('Engineering')

  end
end
