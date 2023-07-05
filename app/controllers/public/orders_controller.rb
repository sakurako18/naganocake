class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customers = current_customer

    @cart_items = @customers.cart_items
      if @cart_items.empty?
        redirect_to public_cart_items_path
      end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    cart_items = current_customer.cart_items
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.price = cart_item.item.price
        order_detail.amount =cart_item.amount
        order_detail.making_status = 0
        order_detail.save
      end
    redirect_to public_orders_complete_path
  end

  def complete
    cart_items = current_customer.cart_items
    cart_items.destroy_all
  end

  def confirm
    @customer_id = current_customer.id
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.postage = 800
    @total_price = @cart_items.cart_items_total_price(@cart_items)

    if params[:order][:address_radio_button] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_radio_button] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
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
    @order_details = @order.order_details


  end

    private
  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :name, :total_price, :customer_id, :postage, :order_status)
  end

end
