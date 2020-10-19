class ActiveAdminController < ApplicationController

	def authenticate_admin_user!
    authenticate_user!
    unless current_user.superadmin
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end
end