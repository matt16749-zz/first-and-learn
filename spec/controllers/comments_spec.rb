require 'rails_helper'
RSpec.describe CommentsController, :type => :controller do 
  let(:user) { create(:user) }
  let(:path) { create(:path, user_id: user.id) }
  let(:asset) { create(:asset, user_id: user.id) }
  let(:comment) {create(:comment, user_id: user.id, commentable_type:"Path")}

  before :each do
    User.destroy_all
    Asset.destroy_all
  end

  describe 'GET #show' do 
    it 'responds successfully with an HTTP 200 status code for path comments' do 
      get :show, path_id: path.id, id: comment.id
      expect(response).to have_http_status(200)      
    end

    it 'responds successfully with an HTTP 200 status code for asset comments' do    
      get :show, asset_id: asset.id, id: comment.id
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it 'responds successfully with an HTTP 200 status code for path comments' do
      sign_in :user, user
      get :index, path_id: path.id, id: comment.id
      expect(response).to have_http_status(200)
    end
  
    it 'responds successfully with an HTTP 200 status code for asset comments' do
      sign_in :user, user
      get :index, asset_id: asset.id, id: comment.id
      expect(response).to have_http_status(200)
    end  
  end

  describe "POST #create" do
    it 'should redirect and provide status 302 upon path comment creation' do
      sign_in :user, user
      post :create, comment: FactoryGirl.attributes_for(:comment), path_id: path.id, commentable_type: "Path"
      expect(response).to have_http_status(302)
    end

    it 'should redirect and provide status 302 upon asset comment creation' do
      sign_in :user, user
      post :create, comment: FactoryGirl.attributes_for(:comment), asset_id: asset.id, commentable_type: "Path"
      expect(response).to have_http_status(302)
    end

    it 'should increase path comment count in db by 1' do
      sign_in :user, user
      expect { post :create, comment: FactoryGirl.attributes_for(:comment), path_id: path.id, commentable_type: "Path" }.to change{Comment.count}
    end

    it 'should increase asset comment count in db by 1' do
      sign_in :user, user
      expect { post :create, comment: FactoryGirl.attributes_for(:comment), asset_id: asset.id, commentable_type: "Path" }.to change{Comment.count}
    end
  end
end