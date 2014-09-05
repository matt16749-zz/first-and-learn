class CreatePathsTags < ActiveRecord::Migration
  def change
    create_table :paths_tags do |t|
      t.integer :path_id, :null => false
      t.integer :tag_id, :null => false
    end
  end
end
