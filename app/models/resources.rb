class Resource < ActiveRecord::Base
  validates :title, :description, :url, :user_id, presence: true
end
