class BookingsController < ApplicationController
    
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
      if params[:booking_id]
        if params[:commit] == "修改需求"
          @booking = Booking.find(params[:booking_id])
          @booking.update(booking_params)
          redirect_to edit_booking_path(@booking)
        elsif params[:commit] == "預約確認"
          @booking = Booking.find(params[:booking_id])
          @booking.update(booking_params)
          redirect_to booking_path(params[:booking_id], :user_id => @user)
        end  
      else
        @booking = Booking.find(params[:id])
        if @booking.update(booking_params)
          redirect_to edit_user_path(@booking.user, :booking_id => @booking.id)
        else
          render :back
        end
      end
    end



  private


  def booking_params
    params.require(:booking).permit( :date, :time, :people, :service_hour, :company, :username, :phone, :contact_email, :address, :remark) 
  end



end
