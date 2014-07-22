class AddGiftMessageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gift_message, :string
  end
end
