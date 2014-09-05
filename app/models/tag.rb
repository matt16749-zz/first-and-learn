class Tag < ActiveRecord::Base
  has_many :assets
  has_many :paths

  validates :name, presence: true
  validates :name, uniqueness: true
end
