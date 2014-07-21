class RegistrationsController < Devise::RegistrationsController
  layout 'qubico'

  def create
    @user = UserRegistration.from_stripe_params(stripe_params)

    if @user.persisted?
      if @user.gift_recipient?
        redirect_to page_path('gift_sent')
      else
        expire_data_after_sign_in!
        respond_with @user, location: confirmation_sent_path
      end
    else
      flash.now[:error] = @user.errors.full_messages.first
      render :new
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
