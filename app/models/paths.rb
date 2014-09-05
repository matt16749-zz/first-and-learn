class Path < ActiveRecord::Base
  validates :title, :description, :user_id, presence: true
end
