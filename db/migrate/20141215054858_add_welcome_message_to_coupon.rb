class AddWelcomeMessageToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :welcome_message, :text
  end
end
