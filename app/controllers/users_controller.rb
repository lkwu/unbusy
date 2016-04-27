class UsersController < ApplicationController


  def edit
  	@booking = Booking.find(params[:booking_id])
    @user = User.find(params[:id])
    if current_user == @user
    else
      redirect_to root_path	
    end 
  end


  def update
  	params[:booking_id]

  	if params[:commit] == "修改需求"
  	  @user = User.find(params[:id])
  	  @user.update(user_params)
  	  redirect_to edit_booking_path(params[:booking_id])
    elsif params[:commit] == "預約確認"
      @user = User.find(params[:id])
  	  @user.update(user_params)
  	  redirect_to booking_path(params[:booking_id], :user_id => @user)
    end
  end

  private

  def user_params
    params.require(:user).permit( :company, :username, :phone, :contact_email, :address, :remark)	
  	
  end



end
