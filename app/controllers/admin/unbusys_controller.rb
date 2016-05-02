class Admin::UnbusysController < ApplicationController

  before_action :authenticate
  layout "admin"

  def index
    @bookings = Booking.all
  end

  protected

  def authenticate
     authenticate_or_request_with_http_basic do |user_name, password|
         user_name == "unbusyadmin" && password == "unbusyadmin"
     end
  end

end
