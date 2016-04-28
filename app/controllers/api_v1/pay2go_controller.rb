class ApiV1::Pay2goController < ApiController

  # def checkout_pay2go
  #   curent_user
  #   @booking = current_user.booking.find( params[:id] )
  #   @payment = Payment.where(booking: @booking)
  #   if @booking.paid?
  #     render :json => { :message => '已經付款'}
  #   else
  #     pay2go = Pay2go.new(@payment)
  #     uri = URI("https://capi.pay2go.com/MPG/mpg_gateway")
  #     res = Net::HTTP.post_form(uri, pay2go.generate_pay2go_params)
  #     results = CGI::parse(res.body)
  #   end
  # end

end