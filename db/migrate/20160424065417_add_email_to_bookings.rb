class AddEmailToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :email, :integer
    add_index :bookings, :email
  end
end
