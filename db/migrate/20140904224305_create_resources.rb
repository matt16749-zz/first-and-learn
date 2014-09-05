class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.text :url, :null => false, :limit => 500
      t.integer :user_id, :null => false
    end
  end
end
