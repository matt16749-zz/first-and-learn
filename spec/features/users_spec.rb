require 'rails_helper'

feature 'Index page' do
  scenario 'Shows the index page' do
    visit '/'
    expect(page).to have_content "First and Learn"
  end
end

feature 'Sign up' do
  scenario 'Shows the Sign Up page' do
    visit '/users/sign_up'
    expect(page).to have_content "Sign up"
    expect(page).to have_content "Last name"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password (8 characters minimum)"
    expect(page).to have_content "Password confirmation"
  end

  scenario 'Signs up a User' do
    user2 = create(:user)
    visit '/users/sign_up'
    fill_in "First name", with: user2.first_name
    fill_in "Last name", with: user2.last_name
    fill_in "Email", with: "user2@gmail.com"
    fill_in "Password", with: user2.password
    fill_in "Password confirmation", with: user2.password
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
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

