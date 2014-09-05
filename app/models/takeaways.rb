class Takeaway < ActiveRecord::Base
  validates :path_id, :resource_id, :body, presence: true
end
