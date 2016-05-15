class Admin::UnbusysController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin
  layout "admin"

  def index
    @bookings = Booking.all
  end

end
