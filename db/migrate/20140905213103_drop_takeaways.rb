class DropTakeaways < ActiveRecord::Migration
  def change
    drop_table :takeaways
  end
end
