class RegistrationsController < Devise::RegistrationsController

  def create
    @user = UserRegistration.from_stripe_params(stripe_params)

    if @user.persisted?
      set_flash_message :notice, :"signed_up_but_#{@user.inactive_message}" if is_flashing_format?
      expire_data_after_sign_in!
      respond_with @user, location: edit_user_path(@user)
    else
      render :new
    end
  end

private

  def stripe_params
    params.permit("plan_id", "stripeToken", "stripeEmail", "stripeBillingName", "stripeBillingAddressLine1",
                  "stripeBillingAddressZip", "stripeBillingAddressCity", "stripeBillingAddressState",
                  "stripeBillingAddressCountry")
  end

end
