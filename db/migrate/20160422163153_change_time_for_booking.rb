class ChangeTimeForBooking < ActiveRecord::Migration
  def change
  	remove_column :bookings, :time
  	add_column :bookings, :morning, :boolean
  	add_column :bookings, :afternoon, :boolean
  end
end
