class UpgradesController < ApplicationController

  before_filter :authenticate_user!

  def index
    # all_seasons=Season.all.select { |x| x.name != 'Spring' }
    all_seasons = Season.all
    @unpurchased_seasons = all_seasons - current_user.seasons
  end

  def create
    @upgrade = Upgrade.create(upgrade_params, current_user)

    if @upgrade.charge_id.present?
      redirect_to upgrade_path('success')
    else
      redirect_to upgrades_path, notice: "Sorry something went wrong processing your card: #{@upgrade.error_message}"
    end
  end

  def show

  end

private

  def upgrade_params
    params.permit(:stripeToken, *billing_params, *shipping_params, season_ids: [])
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
