class Payment < ActiveRecord::Base
  belongs_to :booking

  serialize :params, JSON

  def self_find_and_process(params)
    result = JSON.parse( params['Result'] )

    payment = self.find( result['MerchantOrderNo'].to_i )
    payment.paid = params['Status'] == 'SUCCESS'
    payment.params = params
    payment
  end

end
