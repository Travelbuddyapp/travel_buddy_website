class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :require_permission

  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected
  
  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :birth_date << :phone_number << :gender << :avatar
   devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :birth_date << :phone_number << :gender << :avatar
  end

  def require_permission
    if user_signed_in? && params[:id]
      if params[:user_id] == current_user.id.to_s
      elsif params[:id] == current_user.id.to_s
      else
        flash[:error1] = "Wrong route, You can only see your stuff."
        redirect_to root_path
      end
    end
  end
  # I'm proud of this bit of code, I wrote it myself! -Willard Moore
end



