class Tag < ActiveRecord::Base
  default_scope { order(:name => :asc) }

  has_and_belongs_to_many :assets
  has_and_belongs_to_many :paths

  validates :name, presence: true
  validates :name, uniqueness: true
end
