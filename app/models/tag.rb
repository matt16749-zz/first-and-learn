class Tag < ActiveRecord::Base
  has_many :resources
  has_many :paths

  validates :type, presence: true
end
