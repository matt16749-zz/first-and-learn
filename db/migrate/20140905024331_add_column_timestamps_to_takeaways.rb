class AddColumnTimestampsToTakeaways < ActiveRecord::Migration
  def change
    add_column(:takeaways, :created_at, :datetime)
    add_column(:takeaways, :updated_at, :datetime)
  end
end
