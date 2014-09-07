require 'rails_helper'

RSpec.describe StepsController, :type => :controller do
  let(:user) { create(:user) }
  let(:asset) { create(:asset) }
  let(:path) { create(:path) }
  let(:step) { create(:step) }

  before :each do
    User.destroy_all
    Asset.destroy_all
    Step.destroy_all
    Path.destroy_all
  end

  describe "GET #show" do
    it 'responds successfully with an HTTP 200 status code' do
      get :show, path_id: path.id, id: step.id
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it 'responds successfully with an HTTP 200 status code' do
      sign_in :user, user
      get :edit, path_id: path.id, id: step.id
      expect(response).to have_http_status(200)
    end

    it 'redirects user to login page if not logged in' do
      get :edit, path_id: path.id, id: step.id
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  describe "GET #new" do
    it 'responds successfully with an HTTP 200 status code' do
      sign_in :user, user
      get :new, path_id: path.id, id: step.id
      expect(response).to have_http_status(200)
    end
  end
end
