class CorrectColumnNameToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.rename :desription, :description
    end
  end
end
