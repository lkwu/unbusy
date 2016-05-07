class UsersController < ApplicationController
  before_action :authenticate_user!



  def edit
  	@booking = Booking.find(params[:booking_id])
    @user = User.find(params[:id])
    if current_user == @user
    else
      redirect_to root_path
    end
  end

end
