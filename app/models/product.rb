class Product < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  has_many :cart_items
  has_many :oder_details

  def with_tax_price
    (price * 1.1).floor
  end

end
