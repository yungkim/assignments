require 'rails_helper'

RSpec.describe 'Ninja', type: :feature do

  scenario 'create ninja failed wo/ninja_name' do
    visit '/'
    fill_in 'ninja[description]', with: 'ninja_description'
    click_on 'Submit'
    expect(page).to have_content 'Name is required'
    expect(page).to have_content 'Sorry, failed to submit form'
  end

  scenario 'create ninja failed wo/ninja_description' do
    visit '/'
    fill_in 'ninja[name]', with: 'ninja_name'
    click_on 'Submit'
    expect(page).to have_content 'Description is required'
    expect(page).to have_content 'Sorry, failed to submit form'
  end

  scenario 'create ninja successful' do
    visit '/'
    fill_in 'ninja[name]', with: 'ninja_name'
    fill_in 'ninja[description]', with: 'ninja_description'
    click_on 'Submit'
    expect(page).to have_content 'Form submitted successfully'

  end
end