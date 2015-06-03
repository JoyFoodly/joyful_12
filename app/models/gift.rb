require 'securerandom'

class Gift < ActiveRecord::Base
  belongs_to :giver
  belongs_to :receiver
  belongs_to :coupon, autosave: true
  after_initialize :init_coupon

  validates_presence_of :coupon, :your_name, :your_email, :their_email, :price

  private

  def init_coupon
    self.coupon = build_coupon(description: "Gift for #{their_email} from #{your_name} <#{your_email}>.",
                 shareable_tag: "gift_" + secret_code,
                 price: 0) if new_record?
  end

  def secret_code
    SecureRandom.hex.first(20)
  end
end
