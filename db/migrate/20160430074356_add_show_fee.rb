class AddShowFee < ActiveRecord::Migration
  def change
    add_column :bookings, :show_fee, :integer
  end
end
