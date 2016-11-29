class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :apoiar, unless: :devise_controller?
  helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def apoiar
    if signed_in?
      @user_entidades = User.friendly.find(current_user.slug).entidades
      @user_apoiados = User.friendly.find(current_user.slug).apoiars
    end
  end

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

  def check_if_owner(id)
    if signed_in?
      if ! current_user.admin? and current_user.slug != id
        redirect_to root_url, alert: "Você não possui Permissão"
      end
    end
  end

  def check_owner(user_id)
    if signed_in?
      if ! current_user.admin? and current_user.id != user_id
        redirect_to root_url, alert: "Você não possui Permissão"
      end
    end
  end

  def set_locale
    I18n.default_locale = "pt-BR"
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
