class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nome])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome])
  end

  def check_if_admin
    if signed_in?
      if ! current_user.admin?
        redirect_to root_url, alert: "Você não possui Permissão"
      end
    end
  end

end
