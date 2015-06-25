class ApplicationController < ActionController::Base
	include ApplicationHelper 
	helper :all
	 # Prevent CSRF attacks by raising an exception.
     # For APIs, you may want to use :null_session instead.

protect_from_forgery with: :exception
rescue_from ActionController::RoutingError, :with => :record_not_found
rescue_from ActiveRecord::RecordNotFound, :with => :not_found

#	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
 
def routing_error
    raise ActionController::RoutingError.new(params[:path])
end



	def not_found
	  flash[:error] = "Strona, której szukasz nie istnieje."
	  redirect_to root_url
	end

	def record_not_found
	  flash[:error] = "Strona, której szukasz nie istnieje."
	  redirect_to root_url
	end


     rescue_from CanCan::AccessDenied do |exception|
	 flash[:error] = "Zaloguj się aby mieć dostęp do tych zasobów!"
	 redirect_to new_user_session_path
	end


  
end
