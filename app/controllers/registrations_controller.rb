class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :under_construction
  
  def create
    @user = UserRegistration.from_stripe_params(stripe_params)

    if @user.persisted?
      set_flash_message :notice, :"signed_up_but_#{@user.inactive_message}" if is_flashing_format?
      expire_data_after_sign_in!
      respond_with @user, location: root_url
    else
      flash.now[:error] = @user.errors.full_messages.first
      render :new
    end
  end

private

  def stripe_params
    params.permit("plan_id", "product_id", "stripeToken", "stripeEmail", *billing_params, *shipping_params)
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
