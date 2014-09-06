require 'rails_helper'

RSpec.describe AssetsController, :type => :controller do
  let(:user) { create(:user) }

  before :each do
    User.destroy_all
    Asset.destroy_all
  end

  describe "GET #index" do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      sign_in :user, user
      get :new
      expect(response).to have_http_status(200)
    end

    it "responds with a HTTP 302 status if user isn't logged in" do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  end
end
