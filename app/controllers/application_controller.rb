class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top,:about]
  before_action :correct_user, only: [:edit, :update]

  def after_sign_in_path_for(resource)
    flash[:notice] = "Signed in successfully."
    user_path(current_user.id)
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = "Welcome! You have signed up successfully."
    user_path(current_usr.id)
  end


  def after_sigh_out_path_for(resource)
    flash[:notice] = "Signed out successfully."
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])

  end
end
