class Subscription < ActiveRecord::Base
  belongs_to :user

  validates :payment_token, presence: true

  def self.build_from_stripe_payment(stripe_payment)
    new(payment_token: stripe_payment.fetch('stripeToken'))
  end
end
