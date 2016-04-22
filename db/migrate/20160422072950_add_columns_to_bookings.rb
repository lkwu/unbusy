class AddColumnsToBookings < ActiveRecord::Migration
  def change

    add_column :bookings, :people, :integer
    add_column :bookings, :service_hour, :integer
    add_column :bookings, :paid, :boolean, :default => false
    add_index :bookings, :user_id
  end
end
