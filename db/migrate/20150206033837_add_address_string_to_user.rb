class AddAddressStringToUser < ActiveRecord::Migration
  def change
    add_column :users, :address_string, :text
  end
end
