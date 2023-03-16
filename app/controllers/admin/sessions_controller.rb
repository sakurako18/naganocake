class Admin::SessionsController < Devise::SessionsController
  layout 'layouts/application'

  # GET /resource/sign_in
  # def new
  #   super
  # end

  def create
    super
  end

 def destroy
   super
 end

  def after_sign_in_path_for(resource)
    admin_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  private

  def not_authenticated
    flash[:warning] = 'ログインしてください'
    redirect_to admin_login_path
  end

end
