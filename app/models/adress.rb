class Adress < ApplicationRecord
  belongs_to :customer
  def address_display
  '〒' + postal_code + ' ' + adress + ' ' + name
  end
end
