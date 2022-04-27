class Order < ApplicationRecord
  has_one :customers

  enum payment_method: { credit_card: 0, transfer: 1 }
end
