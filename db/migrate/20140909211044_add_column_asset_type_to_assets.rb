class AddColumnAssetTypeToAssets < ActiveRecord::Migration
  def change
    add_column(:assets, :asset_type, :string, default: "tutorial")
  end
end
