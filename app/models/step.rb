class Step < ActiveRecord::Base
  belongs_to :asset
  belongs_to :path

  validates :path_id, :asset_id, :body, presence: true
end
