require 'rails_helper'

RSpec.describe VotesController, :type => :controller do
  let(:user) { create(:user) }
  let(:path) { create(:path, user_id: user.id) }
  let(:asset) { create(:asset, user_id: user.id) }

  describe "POST #create" do
    it 'should create a vote for a path if a user is logged in'
  end
end
