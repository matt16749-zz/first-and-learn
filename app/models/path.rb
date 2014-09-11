class Path < ActiveRecord::Base
  default_scope { order(:created_at => :asc) }

  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :steps, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy
  has_many :votes, as: :voteable, :dependent => :destroy

  validates :title, :description, :user_id, presence: true
end
