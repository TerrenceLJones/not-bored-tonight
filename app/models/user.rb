class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, :first_name, :last_name
  validates_presence_of :password, on: :create
  validates_uniqueness_of :email
end
