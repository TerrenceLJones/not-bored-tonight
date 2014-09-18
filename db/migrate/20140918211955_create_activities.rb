class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :time
      t.string :venue_name
      t.string :location
      t.text :desription
      t.timestamps
    end
  end
end
