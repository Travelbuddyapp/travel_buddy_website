class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :require_permission, except: [:destroy]

  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :birth_date << :phone_number << :gender << :avatar
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :birth_date << :phone_number << :gender << :avatar
  end
  # TODO: Do we need validation below now that user route is gone?
  # I commented out below since we should no longer need it.
  # If we need to add if back in, specs will have to be made for it!

  def require_permission
    # binding.pry
    if user_signed_in? && params[:id]
      if params[:controller].singularize.camelize.constantize.find(params[:id]).user_id != current_user.id
        lost_user_path
        # flash[:error] = "Wrong route, You can only see your stuff."
        # redirect_to root_path
      end
    end
  end
  # This was made after we removed nested routes inside of user. -Willard Moore

  # def require_permission
  #   if user_signed_in? && params[:id]
  #     if params[:user_id] == current_user.id.to_s
  #     elsif params[:id] == current_user.id.to_s
  #     else
  #       flash[:error1] = "Wrong route, You can only see your stuff."
  #       redirect_to root_path
  #     end
  #   end
  # end
  # This was made when everything was nested inside of user. -Willard Moore

  def restrict_access
    lost_user_path
    # redirect_to root_path, :alert => "Access denied"
  end

  def lost_user_path
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

end



