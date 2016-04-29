class ChangeTable < ActiveRecord::Migration
  def change
    add_column :bookings, :phone, :string
  	add_column :bookings, :address, :text 
  	add_column :bookings, :company, :string
  	add_column :bookings, :remark, :text 
  	add_column :bookings, :contact_email, :string

    remove_column :users, :phone
    remove_column :users, :address
    remove_column :users, :company
    remove_column :users, :remark
    remove_column :users, :contact_email


  end
end
