class Public::HomesController < ApplicationController
  def top
    @item = Item.new
    @items = Item.all
  end

  def about
  end
end

def item_params
  params.require(:item).permit(:item_id)
end