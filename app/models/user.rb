class User < ActiveRecord::Base
  validates :username, length: { minimum: 5, maximum: 20 }
  validates :password, length: { minimum: 8, maximum: 20 }
  validates_uniqueness_of :username
end
