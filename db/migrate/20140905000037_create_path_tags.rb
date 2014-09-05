class CreatePathTags < ActiveRecord::Migration
  def change
    create_table :path_tags do |t|
      t.integer :path_id
      t.integer :tag_id
    end
  end
end
