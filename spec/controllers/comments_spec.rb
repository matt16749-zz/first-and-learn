require 'rails_helper'
RSpec.describe CommentsController, :type => :controller do 
  let(:user) { create(:user) }
  let(:path) { create(:path, user_id: user.id) }
  let(:asset) { create(:asset, user_id: user.id) }
  let(:comment) {create(:comment, user_id: user.id, commentable_type:"Path")}

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

end