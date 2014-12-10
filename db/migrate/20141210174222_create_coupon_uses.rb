class CreateCouponUses < ActiveRecord::Migration
  def change
    create_table :coupon_uses do |t|
      t.integer :coupon_id
      t.integer :user_id

      t.timestamps
    end
  end
end
