class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user_id, :vote_state, :voteable_type, :voteable_id, presence: true
end
