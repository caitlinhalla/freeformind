class Product < ApplicationRecord
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", small: "140x140>", thumb: "64x64!" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :reviews
  has_many :users, :through => :reviews
  validates :name, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true
end
