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

  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status' do
      asset = create(:asset)
      get :show, {:id => asset.id}
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

  describe "POST #create" do
    it 'responds successfully with an HTTP 302 status code' do
      sign_in :user, user
      post :create, asset: FactoryGirl.attributes_for(:asset)
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #edit" do
    it 'responds successfully with an HTTP 200 status code' do
      sign_in :user, user
      asset = create(:asset)
      get :edit, {id: asset.id}
      expect(response).to have_http_status(200)
    end

    it 'responds successfully with an HTTP 302 status code if user not logged in' do
      asset = create(:asset)
      get :edit, {id: asset.id}
      expect(response).to have_http_status(302)
    end
  end

  describe "POST #update" do
    it 'responds successfully with an HTTP 302 status code' do
      sign_in :user, user
      asset = create(:asset)
      post :update, id: asset.id, asset: FactoryGirl.attributes_for(:asset)
      expect(response).to have_http_status(302)
    end
  end
end
