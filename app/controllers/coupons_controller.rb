class CouponsController < ApplicationController
  def show
    return unless request.xhr?
    session[:partner_id] = params[:partner_id]
    set_price
    render json: { shareable: @coupon.try(:shareable_tag),
                   welcome_message: @coupon.try(:welcome_message),
                   price: @coupon.try(:price),
                   gift_price: @coupon.try(:gift_price) }
  end

  def sign_up
    session[:partner_id] = params[:partner_id]
    set_price
    redirect_to new_user_registration_path
  end
end
