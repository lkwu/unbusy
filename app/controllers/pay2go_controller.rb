class Pay2goController < ApplicationController

  skip_before_action :verify_authenticity_token

  def return #returnURL: Pay2go用來通知使用者付款成功
    result = nil
    ActiveRecord::Base.transaction do
      # @payment = Payment.find_and_process( json_data )
      resp = JSON.parse(params[:JSONData])
      result = JSON.parse(resp['Result'])
      pay2go_config = Rails.application.config_for(:pay2go)
      chain = "Amt=#{result['Amt']}&MerchantID=#{'17464120'}&MerchantOrderNo=#{result['MerchantOrderNo']}&TradeNo=#{result['TradeNo']}"
      @check_code = Digest::SHA256.hexdigest("HashIV=#{pay2go_config["hash_iv"]}&#{chain}&HashKey=#{pay2go_config["hash_key"]}").upcase
    end

    if @check_code == result['CheckCode']
      @booking = Booking.find(result['ItemDesc'].split(' ').last.to_i)

      @booking.paid = true
      @booking.save!

      UserMailer.notify_comment(@booking, current_user).deliver_later
      # And then Pay2go will send a paid email to user
    end
    redirect_to booking_path(@booking)
  end

  def notify #notifyURL: Pay2go用來通知店家後台交易成功
    result = nil

    ActiveRecord::Base.transaction do
      @payment = PaymentPay2go.find_and_process( json_data )
      result = @payment.save
    end

    if result
      render :text => "1|OK"
    else
      render :text => "0|ErrorMessage"
    end
  end

  def json_data
    JSON.parse( params["JSONData"] )
  end

end