require 'rails_helper'

RSpec.describe VotesController, :type => :controller do
  let(:user) { create(:user) }
  let(:path) { create(:path, user_id: user.id) }
  let(:asset) { create(:asset, user_id: user.id) }

end
