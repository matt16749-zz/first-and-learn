class ChangeResourceIdToAssetIdTakeaways < ActiveRecord::Migration
  def change
    change_table :takeaways do |t|
      t.rename :resource_id, :asset_id
    end
  end
end
