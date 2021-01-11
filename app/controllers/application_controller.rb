class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception is enable by default in ActionController::Base
  #https://stackoverflow.com/questions/55860171/protect-from-forgery-in-rails-6/55863163

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_request!

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] },  :name, :phone_number, :email, :password, :password_confirmation, :biography) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit({ roles: [] },  :name, :phone_number, :email, :password, :current_password, :biography) }
      #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :phone_number, :email, :password, :current_password) }
  end
end
