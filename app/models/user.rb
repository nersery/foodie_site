class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates :username, :presence => { :message => "You must write your account" }
  validates :username, :uniqueness => { :message => "This account already exists", :case_sensitive => false }
  validates :password, :length => { :minimum => 6, :too_short => "It should be more than 6 characters long" }
end
