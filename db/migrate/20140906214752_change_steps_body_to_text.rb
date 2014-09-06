class ChangeStepsBodyToText < ActiveRecord::Migration
  def change
    change_column :steps, :body, :text
  end
end
