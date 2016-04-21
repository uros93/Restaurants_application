class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to restaurants_path, :alert => exception.message
  end

  before_filter :configure_permited_params, if: :devise_controller?



  protected

  def configure_permited_params
  	devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:email, :password, :password_confirmation,:nick)}

  	devise_parameter_sanitizer.for(:account_update){|u| u.permit(:email, :password, :password_confirmation, :current_password, :nick, :description)}
  end

end
