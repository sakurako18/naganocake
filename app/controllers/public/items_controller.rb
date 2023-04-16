class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def price
        price*1.1
  end

  private
  def item_params
    params.require(:item).permit(:image)
  end

end
