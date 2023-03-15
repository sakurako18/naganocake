# frozen_string_literal: true

class Public::ConfirmationsController < Devise::ConfirmationsController

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email ,:encrypted_password])
  end
end
