class ApplicationController < ActionController::Base
	include ApplicationHelper 
	helper :all
	 # Prevent CSRF attacks by raising an exception.
     # For APIs, you may want to use :null_session instead.
before_action :configure_permitted_parameters, if: :devise_controller?
protect_from_forgery with: :exception
rescue_from ActionController::RoutingError, :with => :record_not_found
rescue_from ActiveRecord::RecordNotFound, :with => :not_found
def routing_error
    raise ActionController::RoutingError.new(params[:path])
end





protected

	def not_found
	  flash[:error] = "Strona, której szukasz nie istnieje."
	  redirect_to root_url
	end

	def record_not_found
	  flash[:error] = "Strona, której szukasz nie istnieje."
	  redirect_to root_url
	end

     rescue_from CanCan::AccessDenied do |exception|
	 if current_user == nil
	 	flash[:error] = "Zaloguj się aby mieć dostęp do tych zasobów!"
	 	redirect_to new_user_session_path
	 else
	 	flash[:error] = "Niestety nie masz dostępu do tych zasobów."
	 	redirect_to root_url
	  end
	end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:login, :email, :password, :password_confirmation, :current_password) }
  end
  
end
