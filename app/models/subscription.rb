class Subscription < ActiveRecord::Base
  belongs_to :user
  delegate :email, to: :user, prefix: true

  validates :card_token, presence: true
  validates :plan_id, inclusion: { in: %w[seasonal beta annual] }
  validates :user, associated: true
  validate :stripe_customer_created, on: :create

private

  def stripe_customer_created
    return if errors.present?
    Stripe::Customer.create(
      card: card_token,
      plan: plan_id,
      email: user_email
    )
  rescue Stripe::StripeError => error
    errors[:base] << error.message
  end

end
