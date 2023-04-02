class Public::CustomersController < ApplicationController

  def show
    @customers = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
  end
end
