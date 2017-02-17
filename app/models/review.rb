class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :author, :presence => true
  validates :content, :presence => true
  validates :rating, :presence => true
end
