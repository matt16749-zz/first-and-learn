class Comment < ActiveRecord::Base
  validates :body, :user_id, :commentable_type, :commentable_id, presence: true
end
