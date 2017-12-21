class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :second_name, :email, :password])
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
