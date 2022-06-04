class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :product_id, presence: true

  def subtotal
    product.with_tax_price * amount
  end

  def sum_of_price
    product.with_tax_price * amount
  end

end
