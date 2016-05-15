class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	if params[:look_bookings]
  	  user_path(current_user)
    elsif params[:booking_id]
      edit_user_path(current_user, :booking_id => params[:booking_id] )
  	else
      request.env['omniauth.origin'] || stored_location_for(resource) || new_booking_path
    end
  end

  def check_admin
    unless current_user.admin
      flash[:alert] = "您無權限造訪此頁面"
      redirect_to root_path
      return
    end
  end

end
