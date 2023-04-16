class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total_price = 0


  end

  def create
      # binding.pry
      @total_price = 0
      @cart_item = current_customer.cart_items.new(cart_item_params)
      if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
         cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
         amount = cart_item.amount + params[:cart_item][:amount].to_i
         cart_item.update(amount: amount)
         redirect_to public_cart_items_path

      elsif @cart_item.save
            @cart_items = current_customer.cart_items.all
            render 'index'
      else# 保存できなかった場合
            render 'index'
      end


  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
      redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
    # notice: 'カートが空になりました。'
  end

  def price
        price*1.1
  end

    private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :image)
  end
end
