class BookingsController < ApplicationController

    def index
      @bookings = Booking.all
    end

	def new
      @booking = Booking.new
	end

    def create
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      if @booking.save
        if current_user
          redirect_to edit_user_path(current_user, :booking_id => @booking.id)
        else
      	  redirect_to  booking_login_url(@booking)
        end
      else
        redirect_to :back
      end
    end

    def login
    end

    def checkout_pay2go
      @booking = current_user.bookings.find( params[:id] )

      if @booking.paid?
        redirect_to :back, alert: '已經付款'
      else
        @payment = Payment.create!( :booking => @booking, :payment_method => params[:payment_method] )
        render :layout => false
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
