class Path < ActiveRecord::Base
  default_scope { order(:created_at => :asc) }

  belongs_to :user
  has_many :tags
  has_many :steps, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy
  has_many :votes, as: :voteable, :dependent => :destroy

  validates :title, :description, :user_id, presence: true

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
    tire.search(load: true) do 
      query { string params[:query] }
    end
  end
end
