class AddPriceToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :price, :float
  end
end
