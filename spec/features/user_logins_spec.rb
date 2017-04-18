require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
    first_name: 'Jane',
    last_name: 'Doe',
    email: 'jane@doe.com',
    password: 'janedoe',
    password_confirmation: 'janedoe'
    )
  end
  scenario 'User can log in' do
    visit root_path
    click_on 'Login'
    expect(page).to have_content "Log in"
    fill_in 'Email', with: 'jane@doe.com'
    fill_in 'Password', with: 'janedoe'
    click_button 'Submit'
    expect(page).to have_content "Signed in as Jane Doe"
    save_screenshot
  end
end
