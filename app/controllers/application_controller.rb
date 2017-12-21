class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :second_name, :email, :password])
    #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :second_name, :email, :password) }
    #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :second_name, :email, :password, :current_password, :is_female, :date_of_birth) }
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      pages_path
    else
      search_path
    end  
  end

  def after_sign_out_path_for(resource)
      search_path
  end
end
