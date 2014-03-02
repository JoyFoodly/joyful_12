class UserRegistration

  def self.from_stripe_params(stripe_payment)
    user = build_user_from_stripe_payment(stripe_payment)
    user.transaction do
      user.save!
      create_user_addresses_from_stripe_payment(user, stripe_payment)
      create_user_payment_or_subscription_from_stripe_payment(user, stripe_payment)
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

  def self.create_user_addresses_from_stripe_payment(user, stripe_payment)
    user.billing_addresses.create!(
      name: stripe_payment.fetch("stripeBillingName"),
      line_1: stripe_payment.fetch("stripeBillingAddressLine1"),
      zip_code: stripe_payment.fetch("stripeBillingAddressZip"),
      city: stripe_payment.fetch("stripeBillingAddressCity"),
      state: stripe_payment.fetch("stripeBillingAddressState"),
      country: stripe_payment.fetch("stripeBillingAddressCountry")
    )
    user.shipping_addresses.create!(
      name: stripe_payment.fetch("stripeShippingName"),
      line_1: stripe_payment.fetch("stripeShippingAddressLine1"),
      zip_code: stripe_payment.fetch("stripeShippingAddressZip"),
      city: stripe_payment.fetch("stripeShippingAddressCity"),
      state: stripe_payment.fetch("stripeShippingAddressState"),
      country: stripe_payment.fetch("stripeShippingAddressCountry")
    )
  end

  def self.create_user_payment_or_subscription_from_stripe_payment(user, stripe_payment)
    if stripe_payment[:plan_id].present?
      user.subscriptions.create!(
        card_token: stripe_payment.fetch('stripeToken'),
        plan_id: stripe_payment.fetch('plan_id')
      )
    else
      user.payments.create!(
        card_token: stripe_payment.fetch('stripeToken'),
        product_id: stripe_payment.fetch('product_id')
      )
    end
  end

end
