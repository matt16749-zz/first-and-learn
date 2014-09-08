require 'rails_helper'

RSpec.describe AssetsController, :type => :controller do
  let(:user) { create(:user) }
  let(:asset) { create(:asset, user_id: user.id) }
  
  describe "GET #index" do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status' do
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

    it "redirects to login page if user is not logged in do" do
      get :new
      expect(response).to redirect_to '/users/sign_in'
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
      get :edit, {id: asset.id}
      expect(response).to have_http_status(200)
    end

    it 'redirects to login page if user is not logged in' do
      get :edit, {id: asset.id}
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  describe "POST #update" do
    it 'responds successfully with an HTTP 302 status code' do
      sign_in :user, user
      post :update, id: asset.id, asset: FactoryGirl.attributes_for(:asset)
      expect(response).to have_http_status(302)
    end

    it 'redirects to login page if user is not logged in' do
      post :update, id: asset.id, asset: FactoryGirl.attributes_for(:asset)
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  describe "POST #destroy" do
    it 'responds successfully with an HTTP 302 status code' do
      sign_in :user, user
      post :destroy, id: asset.id
      expect(response).to have_http_status(302)
    end

    it 'redirects to login page if user is not logged in' do
      post :destroy, id: asset.id
      expect(response).to redirect_to '/users/sign_in'
    end
  end
end
