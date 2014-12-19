class AddCouponIdToHomePageFeature < ActiveRecord::Migration
  def change
    add_column :home_page_features, :coupon_id, :integer
  end
end
