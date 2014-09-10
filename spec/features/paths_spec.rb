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
    expect(page).to_not have_button "Create New Path"
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
    expect(page).to have_content "SaltnPepa"
  end

  scenario "Allows Users to click a new path link" do
    visit '/paths'
    click_link "Create New Path"
    fill_in "Title", with: "Tracy Chapman"
    fill_in "Description", with: "Give Me One Reason"
    click_button "Create Path"
    expect(page).to have_content "Tracy Chapman"
    expect(page).to have_content "Give Me One Reason"
  end

  scenario "Allows Users to click back from path link" do
    visit '/paths'
    click_link "Create New Path"
    fill_in "Title", with: "Stevie Wonder"
    fill_in "Description", with: "Isn't She Lovely"
    click_button "Create Path"
    click_link "Back"
    expect(page).to have_link "Stevie Wonder"
  end

  scenario "Allows Users to delete path" do
    visit '/paths'
    click_link "Create New Path"
    fill_in "Title", with: "The Band Perry"
    fill_in "Description", with: "If I Die Young"
    click_button "Create Path"
    click_link "Delete Path"
    expect(page).to_not have_link "The Band Perry"
  end
end

feature "Path Comments" do
  before(:each) do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  scenario "Show New Comment Form" do
    visit '/paths'
    click_link "Create New Path"
    fill_in "Title", with: "Jackson 5"
    fill_in "Description", with: "I Want You Back"
    click_button "Create Path"
    click_link "New Comment"
    expect(page).to have_content "New Comment"
    expect(page).to have_content "Comment"
    expect(page).to have_button "Submit"
  end

  scenario "Create a New Comment" do
    visit '/paths'
    click_link "Create New Path"
    fill_in "Title", with: "Cups"
    fill_in "Description", with: "Anna Kendrick"
    click_button "Create Path"
    click_link "New Comment"
    fill_in "comment[body]", with: "No Diggity"
    click_button "Submit"
    expect(page).to have_content "No Diggity"
  end

  scenario "View Individual Comment" do
    visit '/paths'
    click_link "Create New Path"
    fill_in "Title", with: "ALL"
    fill_in "Description", with: "CAPS"
    click_button "Create Path"
    click_link "New Comment"
    fill_in "comment[body]", with: "MR. T"
    click_button "Submit"
    click_link "Edit"
    expect(page).to have_content "MR. T"
    expect(page).to have_link "Back"
    expect(page).to have_link "Destroy"
  end

  scenario "Destroy Individual Comment" do
    visit '/paths'
    click_link "Create New Path"
    fill_in "Title", with: "MR."
    fill_in "Description", with: "T"
    click_button "Create Path"
    click_link "New Comment"
    fill_in "comment[body]", with: "Respect your mother"
    click_button "Submit"
    click_link "Edit"
    click_link "Destroy"
    expect(page).to_not have_link "MR."
  end
end

