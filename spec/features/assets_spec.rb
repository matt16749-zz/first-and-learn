require 'rails_helper'
feature 'Assets' do
  before(:each) do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  feature 'Viewing Assets' do 
    scenario 'Does not let you create assets if not logged in' do 
      logout(:user)
      visit '/assets'
      expect(page).to_not have_button "Create Asset"
    end
    scenario 'Does let you create assets if logged in' do 
      visit '/assets'
      expect(page).to have_button "Create Asset"  
    end
  end
end