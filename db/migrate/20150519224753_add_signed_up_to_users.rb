class AddSignedUpToUsers < ActiveRecord::Migration
  def up
    add_column :users, :signed_up, :boolean, null: false, default: false
    User.reset_column_information
    User.update_all(signed_up: true)
  end

  def down
    remove_column :users, :signed_up
  end
end
