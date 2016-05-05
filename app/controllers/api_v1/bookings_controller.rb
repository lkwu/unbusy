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
                            :user_id => @user.id,
                            :paid => true,
                          )
    if @booking.save
      render :json => { :id => @booking.id }, :status => 200
    else
      render :json => { :message => "預約失敗", :errors => @booking.errors }, :status => 400
    end
  end

  def index
    @user = User.find_by_authentication_token(params[:auth_token])
    @expired_bookings = @user.bookings.expired 
    expired_bookings = []
    waiting_bookings = []
    @expired_bookings.find_each do |e|
      expired_bookings << { :user_id => @user.id,
                  :booking_id => e.id,
                  :date => e.date,
                  :time => e.time,
                  :fee => e.fee,
                  :username => e.username,
                  :company => e.company,
                  :phone => e.phone,
                  :contact_email => e.contact_email,
                  :address => e.address,
                  :masseur => e.masseur,
                  :remark => e.remark,
                }
    end
    # render :json => expired_bookings
    @waiting_bookings = @user.bookings.waiting
    @waiting_bookings.find_each do |e|
      waiting_bookings << { :user_id => @user.id,
                  :booking_id => e.id,
                  :date => e.date,
                  :time => e.time,
                  :fee => e.fee,
                  :username => e.username,
                  :company => e.company,
                  :phone => e.phone,
                  :contact_email => e.contact_email,
                  :address => e.address,
                  :masseur => e.masseur,
                  :remark => e.remark,
                }
    end
    render :json => { :expired_bookings => expired_bookings,
                      :waiting_bookings => waiting_bookings } 
  end

  
end
