class OderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum making_status: { no_making: 0, waiting: 1, making: 2, confirm: 3 }

end
