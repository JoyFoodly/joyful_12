require 'spec_helper'

describe Subscription do
  describe '#stripe_customer_created' do
    it 'creates a stripe customer' do
      subscription = FactoryGirl.build(:subscription)
      Stripe::Customer.should_receive(:create).with(
        card:  subscription.card_token,
        plan:  subscription.plan_id,
        email: subscription.user_email
      )
      subscription.save
    end
  end
end
