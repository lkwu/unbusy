class AddOmniauthAndAuTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_uid, :string
    add_column :users, :fb_token, :string
    add_column :users, :admin, :boolean
    add_column :users, :authentication_token, :string
    
    add_index :users, :authentication_token, :unique => true
    add_index :users, :fb_uid

  end
end
