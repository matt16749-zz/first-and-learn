class Path < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :takeaways
  has_many :resources, through: :takeaways
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title, :description, :user_id, presence: true
end
