class Pay2goController < ApplicationController

  skip_before_action :verify_authenticity_token

  def return #returnURL: Pay2go用來通知使用者付款成功
    result = nil

    ActiveRacord::Base.transaction do
      @payment = Payment.find_and_process( json_data )
      result = @payment.save
    end

    unless result
      flash[:alert] = t["registration.error.failed_pay"]
    end

    @booking = @payment.booking

    if @payment.paid?
      @booking.paid = true
      @booking.save!
      # And then Pay2go will send a paid email to user
    end
  end

  def notify #notifyURL: Pay2go用來通知店家後台交易成功
    result = nil

    ActiveRacord::Base.transaction do
      @payment = PaymentPay2go.find_and_process( json_data )
      result = @payment.save
    end

  end

  def json_data
    JSON.parse( params["JSONData"] )
  end

end