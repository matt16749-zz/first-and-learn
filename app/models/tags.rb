class Tag < ActiveRecord::Base
  has_many :resources, :paths

  validates :type, presence: true
end
