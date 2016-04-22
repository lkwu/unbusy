class AddColumnsToPayments < ActiveRecord::Migration
  def change

    add_index :payments, :user_id
    add_index :payments, :booking_id
    change_column :payments, :paid, :boolean, :default => false
  end
end
