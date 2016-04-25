class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def show
    @booking = current_user.bookings.find( params[:id] )
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

end
