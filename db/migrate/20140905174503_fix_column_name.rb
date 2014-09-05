class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :tags, :type, :name
  end
end
