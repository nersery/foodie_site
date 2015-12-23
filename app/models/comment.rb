class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :comment, :presence => { :message => "You should write comment" }
end
