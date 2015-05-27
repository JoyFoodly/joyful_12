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
end
