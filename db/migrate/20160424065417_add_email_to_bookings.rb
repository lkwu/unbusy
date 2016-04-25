class AddEmailToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :email, :string
    add_index :bookings, :email
  end
end
