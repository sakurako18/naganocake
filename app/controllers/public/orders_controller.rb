class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @cart_items = current_customer.cart_items
    @customers = current_customer

  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to public_orders_complete_path
  end

  def complete

  end

  def confirm
    @customer_id = current_customer.id
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.postage = 800
    @total_price = @cart_items.cart_items_total_price(@cart_items)

    if params[:order][:address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:address] == "1"
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address] == "2"
      @address = current_customer.addresses.new
      @address.address = params[:order][:address]
      @address.save
      @order.address = @address.address

    end


    # name,postal_code,customer_id（上の方に記入する）
    # @address = Address.find(params[:order][:address_id])
    # @order.postal_code = @address.postal_code
    # @order.address = @address.address
    # @order.name = @address.name
  end

  def index
    @orders = current_customer.orders
  end

  def show
     @order = current_customer.orders.find(params[:id])
  end

    private
  def order_params
    params.require(:order).permit(:payment, :payment, :postal_code, :address, :name, :total_price, :customer_id, :postage, :order_status)
  end

end
