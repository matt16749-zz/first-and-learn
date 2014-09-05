class CreateTakeaways < ActiveRecord::Migration
  def change
    create_table :takeaways do |t|
      t.string :body, :null => false
      t.integer :path_id, :null => false
      t.integer :resource_id, :null => false
    end
  end
end
