class AddColumnTimestampsToResourcesTags < ActiveRecord::Migration
  def change
    add_column(:resources_tags, :created_at, :datetime)
    add_column(:resources_tags, :updated_at, :datetime)
  end
end
