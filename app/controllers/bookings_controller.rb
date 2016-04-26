class BookingsController < ApplicationController
    
    def index
      @bookings = Booking.all
    end

	def new
      @booking = Booking.new
	end
    
    def create
      @booking = Booking.new(booking_params)
      @booking.save
      if current_user
        redirect_to bookings_path
      else
      	redirect_to  booking_login_url(@booking)
      end
    end

    def login
    end



  private


  def booking_params
    params.require(:booking).permit( :date, :time, :people, :service_hour) 
  end



end
