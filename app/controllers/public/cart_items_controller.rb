class Public::CartItemsController < ApplicationController
  has_one_attached :image


  def create
      binding.pry
  end

  def index
    @cart_items = current_customer.cart_items

  end

  def price
        price*1.1
  end

    private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :image)
  end
end
