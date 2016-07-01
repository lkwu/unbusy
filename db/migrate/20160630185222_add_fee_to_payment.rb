class AddFeeToPayment < ActiveRecord::Migration
  def change
  	add_column :payments, :fee, :integer
  end
end
