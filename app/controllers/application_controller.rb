class ApplicationController < ActionController::Base
	protect_from_forgery
	
	before_filter :store_location
	
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end

	
	private

	## Devise - Store location upon login/logout
	def store_location
	  session[:passthru] = params[:passthru] if params[:passthru]
	end

	def redirect_back_or_default(default)
	  session[:passthru] || root_path
	end

	def after_sign_in_path_for(resource_or_scope)
	  redirect_back_or_default(resource_or_scope)
	end 

	def after_sign_out_path_for(resource_or_scope)
	  redirect_back_or_default(resource_or_scope)
	end 

    
end
