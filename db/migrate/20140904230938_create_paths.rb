class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.integer :user_id, :null => false
    end
  end
end
