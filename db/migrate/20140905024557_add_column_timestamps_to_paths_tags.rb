class AddColumnTimestampsToPathsTags < ActiveRecord::Migration
  def change
    add_column(:paths_tags, :created_at, :datetime)
    add_column(:paths_tags, :updated_at, :datetime)
  end
end
