class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.integer :position, null: false, default: 1
      t.integer :path_id, null: false
      t.timestamps
    end
  end
end
