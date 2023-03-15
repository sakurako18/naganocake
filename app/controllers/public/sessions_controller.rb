# frozen_string_literal: true
class Public::SessionsController < Devise::SessionsController
 before_action :customer_state, only: [:create]

 def new
  @customer = Customer.new
 end

 def create
   @customer = current_customer.id
 end

 def destroy
 end

 protected

 def customer_state
  @customer = Customer.find_by(email: params[:customer][:email])
   return if !@customer
   if @customer.valid_password?(params[:customer][:password])  && (@customer.active_for_authentication? == false)
      flash[:error] = "退会済みです。"
   end
 end
end
