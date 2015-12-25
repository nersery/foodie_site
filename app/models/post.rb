class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :googlemaps
  validates :title, :presence => { :message => "제목을 작성해 주세요." }
  validates :category, :inclusion => { :in => ["한식","일식","중식","동양식","양식","카페","노미"], :message => "카테고리를 선택해주세요." }
  validates :valuation, :inclusion => { :in => (2..10).to_a.map { |n| n * 0.5} }
  mount_uploader :image, ImageUploader
end
