class RegistrationsController < Devise::RegistrationsController
  # Devise controller for user scope

  layout 'qubico', except: [:new]

  def new
    @user = User.new
    @user.shipping_addresses.build
  end
  
  def create
    if params['stripeToken']
      @user = UserRegistration.from_stripe_params(stripe_params)
    else
      # Enter dummy shipping attributes, if nothing is filled in.
      if all_empty(params[:user][:shipping_addresses_attributes]['0'])
        fill_in_dummy(params[:user][:shipping_addresses_attributes]['0'])
      end

      # Set the country explicitly
      if params[:user][:shipping_addresses_attributes]
        params[:user][:shipping_addresses_attributes]['0'][:country] = 'USA'
      end

      @user = User.new(params[:user].permit(:first_name, :last_name, :email, :password,
                                            :password_confirmation,
                                            shipping_addresses_attributes: [ :line_1, :city, :state, :zip_code, :country]))
      @user.save
    end

    if @user.persisted?
      if session[:partner_id]
#        tag = ActiveSupport::MessageVerifier.new(Joyfoodly::Application.config.secret_key_base).verify(session[:tid])
        coupon = Coupon.find_by_shareable_tag session[:partner_id].downcase
        @user.coupons << coupon
      end
      
      if @user.gift_recipient?
        redirect_to page_path('gift-sent')
      else
        expire_data_after_sign_in!
        respond_with @user, location: confirmation_sent_path
      end
    else
      if params[:from_page]
        flash[:message]=@user.errors.full_messages.first
        redirect_to "#{params[:from_page]}"
      else
        flash[:signup_error_message]=@user.errors.full_messages.first
        render 'users/registrations/new'
      end
    end
  end

  private
  def all_empty(address_params)
    [:line_1, :city, :state, :zip_code, :country].inject(true) do |cond, k|
      cond && (address_params[k].nil? || /^\s*$/.match(address_params[k]))
    end
  end

  def fill_in_dummy(address_params)
    [:line_1, :city, :state, :zip_code, :country].each do |k|
      address_params[k] = 'XXXXX'
    end
  end
  
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
