class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  def subtotal
    product.with_tax_price * amount
  end

  def sum_of_price
    item.taxin_price * quantity
  end

end
