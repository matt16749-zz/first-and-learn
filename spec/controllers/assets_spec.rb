require 'rails_helper'

RSpec.describe AssetsController, :type => :controller do
  let(:user) { create(:user) }
  let(:asset) { create(:asset, user_id: user.id) }

  before :each do
    User.destroy_all
    Asset.destroy_all
  end

  describe "GET #index" do
    it 'responds successfully with an HTTP 200 status code' do
      sign_in :user, user
      get :index
      expect(response).to have_http_status(200)
    end

    it "redirects to login page if user is not logged in do" do
      get :index
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status' do
      sign_in :user, user
      get :show, {:id => asset.id}
      expect(response).to have_http_status(200)
    end

    it "redirects to login page if user is not logged in do" do
      get :show, {:id => asset.id}
      expect(response).to redirect_to '/users/sign_in'
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

    it 'increases asset count in db by 1' do
      sign_in :user, user
      expect{
        post :create, asset: FactoryGirl.attributes_for(:asset)
      }.to change{Asset.count}
    end

    it 'should not add an asset to the database without a title' do
      sign_in :user, user
      expect{ 
        post :create, asset: { description: 'description', user_id: user.id, title: '', url: 'http://someurl.com' }
      }.to_not change{Asset.count}
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
      delete :destroy, id: asset.id
      expect(response).to have_http_status(302)
    end

    it 'redirects to login page if user is not logged in' do
      delete :destroy, id: asset.id
      expect(response).to redirect_to '/users/sign_in'
    end

    it 'decreases asset count in db by 1' do
      sign_in :user, user
      my_asset = Asset.create(description: 'description', user_id: user.id, title: 'title', url: 'http://someurl.com')
      expect {delete :destroy, id: my_asset.id}.to change{Asset.count}
    end
  end
end
