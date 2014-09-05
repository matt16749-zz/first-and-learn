class Vote < ActiveRecord::Base
  validates :type, presence: true
end
