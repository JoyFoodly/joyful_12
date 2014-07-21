class AddGiftGiverNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gift_giver_name, :string
  end
end
