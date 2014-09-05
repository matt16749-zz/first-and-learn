class CreateTakeaways < ActiveRecord::Migration
  def change
    create_table :takeaways do |t|
      t.string :body, :null => false
      t.integer :path_id
      t.integer :resource_id
    end
  end
end
