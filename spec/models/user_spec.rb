require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    Fabricate(:user)
  end

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
end
