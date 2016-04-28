class ChangeTable2 < ActiveRecord::Migration
  def change
    add_column :bookings, :username, :string

    remove_column :users, :username
  end
end
