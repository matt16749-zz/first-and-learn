class AddColumnTimestampsToPaths < ActiveRecord::Migration
  def change
    add_column(:paths, :created_at, :datetime)
    add_column(:paths, :updated_at, :datetime)
  end
end
