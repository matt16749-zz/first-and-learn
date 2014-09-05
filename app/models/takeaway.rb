class Takeaway < ActiveRecord::Base
  belongs_to :asset
  belongs_to :path

  validates :path_id, :resource_id, :body, presence: true
end
