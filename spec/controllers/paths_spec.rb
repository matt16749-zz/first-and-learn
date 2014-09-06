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

  describe "GET #new" do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to have_http_status(200)
    end

    it "renders new path form" do
      get :new
      expect(response.body).to render_template(:index)
    end
  end

  describe "POST #create" do
    before(:each) do
      user = create(:user)
      sign_in :user, user
      post :create, path: FactoryGirl.attributes_for(:path), user_id: user.id
    end

    it "creates a new path object" do
      expect(Path.all.count).to eq(1)
    end

    it "creating a new path redirects the user and has 302 status" do
      expect(response).to have_http_status(302)
    end
  end

end
