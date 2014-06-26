class Upgrade

  attr_accessor :customer_id, :charge_id, :error_message
  attr_reader :params, :user
  def initialize(params = {}, user = nil)
    @params = params
    @user = user
  end

  def self.create(params, user)
    if params[:season_ids].present?
      new(params, user).create_payment
    else
      new.tap {|upgrade| upgrade.error_message = "Season ids required"}
    end
  end

  def create_payment
    create_stripe_customer
    create_stripe_payment
    self
  end

private

  def create_stripe_customer
    if user.payment_gateway_customer_id.present?
      self.customer_id = user.payment_gateway_customer_id
    else
      customer = Stripe::Customer.create(
          email: user.email,
          card: params.fetch('stripeToken'),
          metadata: { user_id: user.id },
      )
      self.customer_id = customer.id
      user.update_attributes!(payment_gateway_customer_id: customer.id)
    end
  rescue Stripe::StripeError => error
    self.error_message = error.message
  end

  def create_stripe_payment
    return if error_message.present?
    charge = Stripe::Charge.create(
        customer: customer_id,
        amount: amount,
        description: "Joyful 12 seasons: #{params[:season_ids]}",
        currency: 'usd',
    )
    self.charge_id = charge.id
  rescue Stripe::StripeError => error
    self.error_message = error.message
  end

  def amount
    ENV['PRICE_PER_SEASON'].to_i * params[:season_ids].count
  end

end
