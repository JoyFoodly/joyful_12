class CouponAllocation < ActiveRecord::Base
  belongs_to :coupon
  belongs_to :partner
end
