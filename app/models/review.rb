class Review < ActiveRecord::Base
  belongs_to :product
  validates :product_id, :rating, :name, presence: true
end
