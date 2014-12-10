class CreateCouponAllocation < ActiveRecord::Migration
  def change
    create_table :coupon_allocations do |t|
      t.integer :coupon_id
      t.integer :partner_id
    end
  end
end
