class DropResourcesTags < ActiveRecord::Migration
  def change
    drop_table :resources_tags
  end
end
