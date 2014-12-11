class RegistrationsController < Devise::RegistrationsController
  layout 'qubico'

  def create
    @user = UserRegistration.from_stripe_params(stripe_params)

    if @user.persisted?
      tag = ActiveSupport::MessageVerifier.new(Joyfoodly::Application.config.secret_key_base).verify(session[:tid])
      coupon = Coupon.find_by_shareable_tag tag
      @user.coupons << coupon
      
      if @user.gift_recipient?
        redirect_to page_path('gift-sent')
      else
        expire_data_after_sign_in!
        respond_with @user, location: confirmation_sent_path
      end
    else
      redirect_to "#{new_user_registration_path}?message=#{URI.escape(@user.errors.full_messages.first)}#pricing"
    end
  end

private

  def stripe_params
    params.permit("plan_id", "product_id", "stripeToken", "stripeEmail", *recipient_params, *billing_params, *shipping_params)
  end

  def recipient_params
    %w[
      recipient_email
      recipient_first_name
      recipient_last_name
      recipient_gift_message
      gift_giver_name
    ]
  end

  def billing_params
    %w[
      stripeBillingName
      stripeBillingAddressLine1
      stripeBillingAddressZip
      stripeBillingAddressState
      stripeBillingAddressCity
      stripeBillingAddressCountry
    ]
  end

  def shipping_params
    %w[
      stripeShippingName
      stripeShippingAddressLine1
      stripeShippingAddressZip
      stripeShippingAddressState
      stripeShippingAddressCity
      stripeShippingAddressCountry
    ]
  end

end
