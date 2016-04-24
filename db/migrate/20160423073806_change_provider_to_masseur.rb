class ChangeProviderToMasseur < ActiveRecord::Migration
  def change
  	remove_column :bookings, :provider
  	add_column :bookings, :masseur, :integer
  end
end
