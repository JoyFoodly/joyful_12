class UserRegistration

  def self.from_stripe_params(stripe_payment)
    User.build_from_stripe_payment(stripe_payment).tap do |user|
      user.addresses << Address.build_from_stripe_payment(stripe_payment)
      user.subscriptions << Subscription.build_from_stripe_payment(stripe_payment)
    end
  end

end
