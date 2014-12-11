class Payment < ActiveRecord::Base
  belongs_to :user
  
  before_validation :set_amount
  
  validates :amount,      presence: true, numericality: { greater_than: 0 }
  validates :card_token,  presence: true
  validates :product_id,  presence: true, inclusion: { in: %w[beta season year] }
  validates :user_id,     presence: true
  validate :create_stripe_customer
  validate :create_stripe_charge
  validates :customer_id, presence: true
  validates :charge_id,   presence: true
  
  private
  
  def set_amount
    if Rails.env.development?
      self.amount = 4242
    else
      self.amount = product_id == 'season' ? ENV['PRICE_PER_SEASON'].to_i : ENV['PRICE_PER_YEAR'].to_i
    end
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
      description: "Joyful 12 #{product_id}",
      currency: 'usd',
    )
    self.charge_id = charge.id
  rescue Stripe::StripeError => error
    errors[:base] << error.message
  end

end
