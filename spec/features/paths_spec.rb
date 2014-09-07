require 'rails_helper'
feature 'Paths' do
  before(:each) do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  scenario "Show the Create New Path button when logged in" do
    visit '/paths'
    expect(page).to have_content "Create New Path"
  end
end

feature 'Creating New Paths' do
  before(:each) do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  scenario "Redirect User to Log in if not signed in" do
    logout(:user)
    visit '/paths'
    click_link "Create New Path"
    expect(page).to have_content "Log in"
  end

  scenario "Show Create New Path Form if Signed In" do
    visit '/paths'
    click_link "Create New Path"
    expect(page).to have_content "Title"
    expect(page).to have_content "Description"
    expect(page).to have_button "Create Path"
  end

  scenario "Allows Users to Create a New Path" do
    visit '/paths'
    click_link "Create New Path"
    fill_in "Title", with: "SaltnPepa"
    fill_in "Description", with: "Push it"
    click_button "Create Path"
    expect(page).to have_link "SaltnPepa"
  end
end
