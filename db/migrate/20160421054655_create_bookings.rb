class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|

      t.integer :user_id
      t.date :date
      t.string :time
      t.integer :provider
      t.integer :fee

      t.timestamps null: false
    end
  end
end
