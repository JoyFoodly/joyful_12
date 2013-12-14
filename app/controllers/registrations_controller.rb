class RegistrationsController < Devise::RegistrationsController

  def create
    @user = UserRegistration.from_stripe_params(stripe_params)

    if @user.save
      set_flash_message :notice, :"signed_up_but_#{@user.inactive_message}" if is_flashing_format?
      expire_data_after_sign_in!
      respond_with resource, location: after_inactive_sign_up_path_for(@user)
    else
      render :new
    end
  end

private

  def stripe_params
    params.permit("stripeToken", "stripeEmail", "stripeBillingName", "stripeBillingAddressLine1",
                  "stripeBillingAddressZip", "stripeBillingAddressCity", "stripeBillingAddressState",
                  "stripeBillingAddressCountry")
  end

end
