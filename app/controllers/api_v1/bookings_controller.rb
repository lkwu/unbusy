class ApiV1::BookingsController < ApiController

  def create

    @booking = Booking.new( :date => params[:date],
                            :time => params[:time],
                            :fee => params[:fee],
                            :people => params[:people],
                            :service_hour => params[:service_hour]
                          )
    @user = User.find_by_authentication_token(params[:auth_token])

    user.update( :username => params[:username],
                 :company => params[:company],
                 :phone => params[:phone],
                 :contact_email => params[:contact_email],
                 :address => params[:address]
               )
    if @booking.save
      render :json => { :id => @booking.id }, :status => 200
    else
      render :json => { :message => "預約失敗", :errors => @booking.errors }, :status => 400
    end
  end

end
