class Admin::OrdersController < ApplicationController

  def show
    @orders = Order.all
    @order = Order.find(params[:id])

    @customer = Customer.find(params[:id])

    @order_details = OrderDetail.all
  end
end
