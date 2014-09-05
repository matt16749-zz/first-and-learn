class CreateResourcesTags < ActiveRecord::Migration
  def change
    create_table :resources_tags do |t|
      t.integer :resource_id, :null => false
      t.integer :tag_id, :null => false
    end
  end
end

