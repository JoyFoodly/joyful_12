class AddTagSaltToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :tag_signed, :string
  end
end
