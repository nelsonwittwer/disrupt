class ApplicationController < ActionController::Base
	protect_from_forgery
	
	before_filter :store_location, :initialize_mixpanel
	
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end

	def initialize_mixpanel
	  if defined?(MIXPANEL_TOKEN)
	    @mixpanel = Mixpanel.new(MIXPANEL_TOKEN, request.env)
	  else
	    @mixpanel = DummyMixpanel.new
	  end
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
