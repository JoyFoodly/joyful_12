class UserRegistration

  def self.from_stripe_params(stripe_payment)
    user = build_user_from_stripe_payment(stripe_payment)
    user.transaction do
      user.save!
      create_user_address_from_stripe_payment(user, stripe_payment)
      create_user_subscription_from_stripe_payment(user, stripe_payment)
    end
    user
  rescue ActiveRecord::RecordInvalid => invalid
    invalid.record
  end

private

  def self.build_user_from_stripe_payment(stripe_payment)
    User.new(
      email: stripe_payment.fetch('stripeEmail'),
      first_name: stripe_payment.fetch('stripeBillingName').split.first,
      last_name: stripe_payment.fetch('stripeBillingName').split[1..-1].try(:join, ' '),
      password: Devise.friendly_token[0,20]
    )
  end

  def self.create_user_address_from_stripe_payment(user, stripe_payment)
    user.addresses.create!(
      line_1: stripe_payment.fetch("stripeBillingAddressLine1"),
      zip_code: stripe_payment.fetch("stripeBillingAddressZip"),
      city: stripe_payment.fetch("stripeBillingAddressCity"),
      state: stripe_payment.fetch("stripeBillingAddressState"),
      country: stripe_payment.fetch("stripeBillingAddressCountry")
    )
  end

  def self.create_user_subscription_from_stripe_payment(user, stripe_payment)
    user.subscriptions.create!(
      card_token: stripe_payment.fetch('stripeToken'),
      plan_id: stripe_payment.fetch('plan_id')
    )
  end

end
