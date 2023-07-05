class Order < ApplicationRecord

  has_many :order_details
  belongs_to :customer

  enum payment: { credit_card: 0, transfer: 1 }
  enum order_status: {wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4}


  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end



end


