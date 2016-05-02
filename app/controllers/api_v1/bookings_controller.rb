class ApiV1::BookingsController < ApiController

  def create
     @user = User.find_by_authentication_token(params[:auth_token])
     @booking = Booking.new( :date => params[:date],
                            :time => params[:time],
                            :fee => params[:fee],
                            :username => params[:username],
                            :company => params[:company],
                            :phone => params[:phone],
                            :contact_email => params[:contact_email],
                            :address => params[:address],
                            :masseur => params[:masseur],
                            :remark => params[:remark],
                            :user_id => @user.id 
                          )

    if @booking.save
      render :json => { :id => @booking.id }, :status => 200
    else
      render :json => { :message => "預約失敗", :errors => @booking.errors }, :status => 400
    end
  end

end
