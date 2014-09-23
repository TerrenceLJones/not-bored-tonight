class AddColumnsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :time, :string
    add_column :activities, :date, :string
  end
end
