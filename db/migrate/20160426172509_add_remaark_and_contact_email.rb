class AddRemaarkAndContactEmail < ActiveRecord::Migration
  def change
  	add_column :users, :remark, :string
  	add_column :users, :contact_email, :string
  end
end
