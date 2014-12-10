class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.text :description
      t.string :shareable_tag
      t.string :shareable_link
      t.string :stripe_coupon_name
      t.datetime :expires_on

      t.timestamps
    end
  end
end
