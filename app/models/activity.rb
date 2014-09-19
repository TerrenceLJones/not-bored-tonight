class Activity < ActiveRecord::Base
  validates_presence_of :name, :location, :time, :user_id
  
  belongs_to :user
end
