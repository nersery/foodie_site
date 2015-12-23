class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, :presence => { :message => "You must write title" }
  validates :category, :inclusion => { :in => ["Korean","Japanese","Chinese","Western"], :message => "You should choose at least one category from Korean, Japanese, Chinese and Western" }
  validates :valuation, :inclusion => { :in => (2..10).to_a.map { |n| n * 0.5} }
  mount_uploader :image, ImageUploader
end
