class CouponsController < ApplicationController
  def show
    return unless request.xhr?
    session[:partner_id] = params[:partner_id]
    set_price
    if @coupon
      render json: { shareable: @coupon.shareable_tag,
                     welcome_message: @coupon.welcome_message,
                     price: @price,
                     gift_price: @gift_price }
    else
      render json: { shareable: nil,
                     welcome_message: nil,
                     price: nil,
                     gift_price: nil }
    end
  end

  def sign_up
    session[:partner_id] = params[:partner_id]
    set_price
    redirect_to new_user_registration_path
  end
end
