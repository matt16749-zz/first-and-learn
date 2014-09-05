class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.string :url, :null => false
      t.integer :user_id
    end
  end
end
