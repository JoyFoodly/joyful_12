class Subscription < ActiveRecord::Base
  has_paper_trail
  belongs_to :user
  delegate :email, to: :user, prefix: true

  validates :card_token, presence: true
  validates :plan_id,    presence: true, inclusion: { in: %w[seasonal beta annual] }
  validates :user,       presence: true
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
