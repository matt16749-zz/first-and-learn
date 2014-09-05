class CreateAssetsTags < ActiveRecord::Migration
  def change
    create_table :assets_tags do |t|
      t.integer :asset_id, :null => false
      t.integer :tag_id, :null => false
      t.timestamps
    end
  end
end
