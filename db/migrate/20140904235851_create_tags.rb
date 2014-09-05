class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :type
    end
  end
end
