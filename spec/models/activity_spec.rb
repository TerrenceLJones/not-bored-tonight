require 'rails_helper'

RSpec.describe Activity, :type => :model do
  before do
    Fabricate(:activity)
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :location }
  it { should validate_presence_of :time }
  it { should validate_presence_of :user_id}
end
