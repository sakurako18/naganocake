class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  
# 合計を計算する
  def self.cart_items_total_price(cart_items) 
    array = []
    cart_items.each do |cart_item|
      array << cart_item.item.price * cart_item.amount
    end
    return (array.sum * 1.1).floor
  end

end
