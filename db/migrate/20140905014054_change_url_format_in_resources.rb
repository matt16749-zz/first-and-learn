class ChangeUrlFormatInResources < ActiveRecord::Migration
  def change
    change_column :resources, :url, :text
  end
end
