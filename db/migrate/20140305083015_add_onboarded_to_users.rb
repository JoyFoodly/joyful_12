class AddOnboardedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :onboarded, :boolean, null: false, default: false
  end
end
