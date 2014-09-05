class Takeaway < ActiveRecord::Base
  belongs_to :resources
  belongs_to :paths

  validates :path_id, :resource_id, :body, presence: true
end
