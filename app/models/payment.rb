class Payment < ActiveRecord::Base
  belongs_to :user

  before_validation :set_amount

  validates :amount,      presence: true, numericality: { greater_than: 0 }
  validates :card_token,  presence: true
  validates :product_id,  presence: true, inclusion: { in: %w[beta] }
  validates :user_id,     presence: true
  validate :create_stripe_customer
  validate :create_stripe_charge
  validates :customer_id, presence: true
  validates :charge_id,   presence: true

private

  def set_amount
    self.amount = 1000 if product_id == 'beta'
  end

  def create_stripe_customer
    return if errors.present?
    if user.payment_gateway_customer_id.present?
      self.customer_id = user.payment_gateway_customer_id
    else
      customer = Stripe::Customer.create(
        email: user.email,
        card: card_token,
        metadata: { user_id: user.id },
      )
      self.customer_id = customer.id
      user.update_attributes!(payment_gateway_customer_id: customer.id)
    end
  rescue Stripe::StripeError => error
    errors[:base] << error.message
  end

  def create_stripe_charge
    return if errors.present?
    charge = Stripe::Charge.create(
      customer: customer_id,
      amount: amount,
      description: 'Joyful 12 beta',
      currency: 'usd',
    )
    self.charge_id = charge.id
  rescue Stripe::StripeError => error
    errors[:base] << error.message
  end

end
