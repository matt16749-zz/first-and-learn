require 'rails_helper'

RSpec.describe StepsController, :type => :controller do
  let(:user) { create(:user) }
  let(:asset) { create(:asset) }
  let(:step) { create(:step) }
  let(:path) { create(:path) }

  before :each do
    User.destroy_all
    Asset.destroy_all
    Step.destroy_all
  end

  describe "GET #show" do
    it 'responds successfully with an HTTP 200 status code' do
      get :show, path_id: path.id, id: step.id
      expect(response).to have_http_status(200)
    end
  end
end
