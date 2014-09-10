class Tag < ActiveRecord::Base
  has_and_belongs_to_many :assets
  has_and_belongs_to_many :paths

  validates :name, presence: true
  validates :name, uniqueness: true
end
