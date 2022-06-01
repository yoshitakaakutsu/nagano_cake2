class Order < ApplicationRecord
  has_one :customers
  has_many :oder_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { waiting: 0, confirm: 1, product: 2, ready_ship: 3, sent: 4 }


  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end


end
