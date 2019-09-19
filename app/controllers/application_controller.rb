class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  include ApplicationConcern

  # layout 'super'

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :user_type])
  end

  def after_sign_in_path_for(resource)
    if current_user.client_admin? 
      client_dashboard_index_path
    elsif current_user.super_admin? 
      super_dashboard_index_path
    else
      root_path
    end
  end


end
