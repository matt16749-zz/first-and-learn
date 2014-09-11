require 'rails_helper'
RSpec.describe TagsController, :type => :controller do
  let(:user) { create(:user) }

  before(:each) do
    sign_in :user, user
  end

  describe "POST #create" do
    it "creates a new tag object" do
      expect {
        post :create, tag: FactoryGirl.attributes_for(:tag)
      }.to change{Tag.count}.by(1)
    end
 end

end
