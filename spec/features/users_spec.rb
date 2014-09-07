require 'rails_helper'

feature 'Index page' do
  scenario 'Shows the index page' do
    visit '/'
    expect(page).to have_content "First and Learn"
  end
end

feature 'Sign in' do
  before(:each) do
    logout(:user)
  end
  scenario 'Shows the Sign In page' do
    visit '/users/sign_in'
    expect(page).to have_content "Log in"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end

  scenario 'Allows a User to Sign In' do
  user = create(:user)
    visit '/users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully. First and Learn"
  end
end

