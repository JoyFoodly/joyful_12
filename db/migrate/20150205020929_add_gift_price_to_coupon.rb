class AddGiftPriceToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :gift_price, :float
  end
end
