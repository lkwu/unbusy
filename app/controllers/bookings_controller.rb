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
      @booking.save
      redirect_to new_session_path(:user, :booking_id => @booking)
    end
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
    if params[:booking_id]
      @booking = Booking.find(params[:booking_id])
      @booking.user = current_user
      @booking.update(booking_params)
      if params[:commit] == "上一步"
        redirect_to edit_booking_path(@booking)
      elsif params[:commit] == "下一步"

        redirect_to booking_path(params[:booking_id], :user_id => @booking.user)
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
    params.require(:booking).permit( :date, :time, :people, :service_hour, :company, :username, :phone, :contact_email, :address, :remark, :fee, :masseur)
  end




end
