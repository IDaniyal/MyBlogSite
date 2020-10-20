class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def authenticate_admin_user!
		authenticate_user!
		unless current_user.superadmin
			flash[:alert] = "Unauthorized Access!"
			redirect_to root_path
		end
	end

  before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	 def configure_permitted_parameters
	   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	 end

end
