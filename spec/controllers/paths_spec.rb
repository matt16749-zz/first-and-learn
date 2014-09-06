require 'rails_helper'
RSpec.describe PathsController, :type => :controller do
  before :each do
    User.destroy_all
    Path.destroy_all
  end

  describe "GET #index" do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end
  end
end
