class BookingsController < ApplicationController
    # before_action :authenticate_user!, :only => [:create]
    def index
      @bookings = Booking.all
    end

	def new
      @booking = Booking.new
	end
    
    def create
      @booking = Booking.new(booking_params)
      if current_user
        @booking.user = current_user
        if @booking.save
          redirect_to edit_user_path(current_user, :booking_id => @booking)
        else
          redirect_to :back 
        end
      else
      	  redirect_to new_session_path(:user, :booking_id => @booking)
      end
    end

    def login
    end

    def show
      @booking = Booking.find(params[:id])
      @user = @booking.user
    end

    def edit
      @booking = Booking.find(params[:id])
      if current_user == @booking.user
        @user = @booking.user
      else
      	redirect_to root_path
      end
    end

    def update
      @booking = Booking.find(params[:id])
      if @booking.update(booking_params)
        redirect_to edit_user_path(@booking.user, :booking_id => @booking.id)
      else
        render :back
      end
    end



  private


  def booking_params
    params.require(:booking).permit( :date, :time, :people, :service_hour) 
  end



end
