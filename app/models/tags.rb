class Tag < ActiveRecord::Base
  validates :type, presence: true
end
