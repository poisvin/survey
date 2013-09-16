class AddRegistrationTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :registration_token, :string
  	add_column :users, :verified, :boolean
  end
end
