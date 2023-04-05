class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @cart_items = current_customer.cart_items


  end

  def create

  end

  def complete

  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    # @address = Address.find(params[:order][:address_id])
    # @order.postal_code = @address.postal_code
    # @order.address = @address.address
    # @order.name = @address.name
  end

  def index

  end

  def show

  end

    private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
