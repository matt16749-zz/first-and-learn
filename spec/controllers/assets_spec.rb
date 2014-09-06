require 'rails_helper'

RSpec.describe AssetsController, :type => :controller do
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
      get :new
      expect(response).to have_http_status(200)
    end
  end
end
