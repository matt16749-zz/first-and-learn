require 'rails_helper'
RSpec.describe TagsController, :type => :controller do
  let(:user) { create(:user) }

  describe "POST #create" do
    before(:each) do
    sign_in :user, user
    post :create, tag: FactoryGirl.attributes_for(:tag)
    end
    it "creates a new tag object" do
      expect(Tag.all.count).to eq(1)
    end
 end

end
