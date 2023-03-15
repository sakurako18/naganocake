class Admin::SessionsController < Devise::SessionsController
  before_action :check_admin
  layout 'layouts/application'

  # GET /resource/sign_in
  # def new
  #   super
  # end

# def create
#   @admin  = current_admin.id
# end

  def create
    @admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      render 'new'
    end
  end

 def destroy
 end

  private

  def not_authenticated
    flash[:warning] = 'ログインしてください'
    redirect_to admin_login_path
  end

  def check_admin
    if admin_signed_in?
    redirect_to root_path
    end
  end
end
