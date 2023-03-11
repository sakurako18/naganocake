# frozen_string_literal: true
class Public::SessionsController < Devise::SessionsController
before_action :customer_state, only: [:create]

protected
def customer_state
 @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer
  if @customer.valid_password?(params[:customer][:password])
  end
end
end
