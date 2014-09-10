class ChangeColAssetTypeToAssetCategory < ActiveRecord::Migration
  def change
    rename_column :assets, :asset_type, :category
  end
end
