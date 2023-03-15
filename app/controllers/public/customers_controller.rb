class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
  end
end
