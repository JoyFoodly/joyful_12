class Payment < ActiveRecord::Base
  belongs_to :user
  
  validates :amount,      presence: true, numericality: { greater_than: 0 }
  validates :card_token,  presence: true
  validates :product_id,  presence: true, inclusion: { in: %w[beta season year] }
  validate :create_stripe_customer
  validate :create_stripe_charge
  validates :customer_id, presence: true
  validates :charge_id,   presence: true
  validate :has_email

  attr_writer :email, :coupon
  attr_accessor :gift
  
  private

  def create_stripe_customer
    return if errors.present?
    if user && user.payment_gateway_customer_id.present?
      self.customer_id = user.payment_gateway_customer_id
    else
      customer = Stripe::Customer.create(
        email: user_email,
        source: card_token,
        metadata: { user_id: user_id },
      )
      self.customer_id = customer.id
      user.update_attribute(:payment_gateway_customer_id, customer.id) if user
    end
  rescue Stripe::StripeError => error
    errors[:stripe] << error.message
  end

  def create_stripe_charge
    return if errors.present?
    charge = Stripe::Charge.create(
      customer: customer_id,
      amount: amount,
      description: "Joyful 12 #{product_id}",
      currency: 'usd',
    )
    self.charge_id = charge.id
  rescue Stripe::StripeError => error
    errors[:stripe] << error.message
  end

  def user_id
    user.id if user
  end

  def user_email
    user ? user.email : @email
  end

  def coupon
    @coupon || (user.coupons.first if user)
  end

  def has_email
   errors.add(:base, 'payment must have email') unless user_email
  end
end
