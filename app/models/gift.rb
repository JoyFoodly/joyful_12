class Gift < ActiveRecord::Base
  belongs_to :giver
  belongs_to :receiver
  belongs_to :coupon

  validates_presence_of :coupon, :your_name, :your_email, :their_email, :price
end
