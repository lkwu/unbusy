module ApplicationHelper

  def generate_pay2go_params(payment)
      pay2go_params = {
        MerchantID: "11825715",
        RespondType: "JSON",
        TimeStamp: payment.created_at.to_i,
        Version: "1.2",
        LangType: "zh-tw",
        MerchantOrderNo: "#{payment.id}AC#{Rails.env.upcase[0]}",
        Amt: payment.booking.fee,
        ItemDesc: "Booking #{payment.booking.id}",
        ReturnURL: "http://localhost:3000/pay2go/return",
        NotifyURL: "http://www.unbusymassage.tech",
        Email: payment.booking.email,
        LoginType: 0,
        CREDIT: 1,
      }

      raw = pay2go_params.slice(:Amt, :MerchantID, :MerchantOrderNo, :TimeStamp, :Version).sort.map!{|ary| "#{ary.first}=#{ary.last}"}.join('&')
      hash_config = Rails.application.config_for(:hash)
      hash_key = "xHBWeY01LaVtAX7mqpLq2Ly4AZMoJSqg"
      hash_iv = "z1cO0dPLoKeYIml8"
      str = "HashKey=#{hash_key}&#{raw}&HashIV=#{hash_iv}"
      check_value = Digest::SHA256.hexdigest(str).upcase

      pay2go_params[:CheckValue] = check_value

      pay2go_params
  end

end
