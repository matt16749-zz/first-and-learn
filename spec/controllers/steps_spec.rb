require 'rails_helper'

RSpec.describe StepsController, :type => :controller do
  let(:user) { create(:user) }
  let(:path) { create(:path, user_id: user.id) }
  let(:asset) { create(:asset, user_id: user.id) }
  let(:step) { create(:step, path_id: path.id, asset_id: asset.id) }

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

    it 'redirects user to login page if not logged in' do
      get :new, path_id: path.id, id: step.id
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  describe "POST #create" do
    it 'should redirect and provide status 302 upon step creation' do
      sign_in :user, user
      post :create, step: FactoryGirl.attributes_for(:step), path_id: path.id, asset: {asset_id: asset.id}
      expect(response).to have_http_status(302)
    end

    it 'should redirect user to login page if not logged in' do
      post :create, step: FactoryGirl.attributes_for(:step), path_id: path.id, asset: {asset_id: asset.id}
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  describe "POST #update" do
    it 'should redirect and provide status 302 upon step update' do
      sign_in :user, user
      post :update, id: step.id, step: FactoryGirl.attributes_for(:step), path_id: path.id, asset: {asset_id: asset.id}
      expect(response).to have_http_status(302)
    end

    it 'should redirect user to login page if not logged in' do
      post :update, id: step.id, step: FactoryGirl.attributes_for(:step), path_id: path.id, asset: {asset_id: asset.id}
      expect(response).to redirect_to '/users/sign_in'
    end
  end

  describe "POST #destroy" do
    it 'responds successfully with an HTTP 302 status code' do
      sign_in :user, user
      post :destroy, path_id: path.id, id: step.id
      expect(response).to have_http_status(302)
    end

    it 'redirects to login page if user is not logged in' do
      post :destroy, path_id: path.id, id: step.id
      expect(response).to redirect_to '/users/sign_in'
    end
  end
end
