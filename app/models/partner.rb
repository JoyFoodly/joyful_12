class Partner < ActiveRecord::Base
  has_many :coupon_allocations, dependent: :destroy
  has_many :coupons, through: :coupon_allocations 
end
