class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|

      t.integer :user_id
      t.integer :booking_id
      t.string :payment_method
      t.integer :amount
      t.boolean :paid
      t.text :params

      t.timestamps null: false
    end
  end
end
