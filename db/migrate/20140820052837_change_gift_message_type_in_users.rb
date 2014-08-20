class ChangeGiftMessageTypeInUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :gift_message, :text
  end

  def self.down
    change_column :users, :gift_message, :string
  end
end
