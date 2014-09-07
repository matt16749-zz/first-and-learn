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

  scenario "Allows Users to click a new path link" do
    visit '/paths'
    click_link "Create New Path"
    fill_in "Title", with: "Tracy Chapman"
    fill_in "Description", with: "Give Me One Reason"
    click_button "Create Path"
    click_link "Tracy Chapman"
    expect(page).to have_content "Tracy Chapman"
    expect(page).to have_content "Give Me One Reason"
  end

  scenario "Allows Users to click back from path link" do
    visit '/paths'
    click_link "Create New Path"
    fill_in "Title", with: "Stevie Wonder"
    fill_in "Description", with: "Isn't She Lovely"
    click_button "Create Path"
    click_link "Stevie Wonder"
    click_link "Back"
    expect(page).to have_link "Stevie Wonder"
  end
end
