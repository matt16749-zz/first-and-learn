class Asset < ActiveRecord::Base
  default_scope { order(:created_at => :desc) }

  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :steps
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title, :description, :url, :user_id, presence: true
end
