class PaymentsController < ApplicationController
  before_action :authenticate_user!, except: [:gift, :create_gift]
  before_action :skip_signed_up_users, except: [:gift, :create_gift]
  before_action :set_price

  def new
    render layout: 'sign_up_flow'
  end

  def gift
    @gift = Gift.new
    render layout: 'sign_up_flow'
  end

  def create_gift
    @gift = Gift.new(gift_params)
    @gift.giver_id = current_user
    @gift.build_coupon
    @payment = Payment.new(payment_params)
    @payment.email = @gift.your_email
    @payment.coupon = found_coupon?
    @payment.gift = true
    if @gift.valid? && @payment.valid?
      ActiveRecord::Base.transaction do
        @gift.save
        @payment.save(validate: false)
      end
      flash[:success] = "Thanks for your purchase!"
      redirect_to root_path
    else
      errors = @payment.errors[:stripe] + @gift.errors.full_messages
      flash.now[:alert] = errors.to_sentence
      render 'gift', layout: 'sign_up_flow'
    end
  end

  def create
    @payment = current_user.payments.build(payment_params)
    if @payment.save
      current_user.update(signed_up: true)
      redirect_to after_sign_in_path_for(current_user)
    else
      flash.now[:alert] = @payment.errors[:stripe].to_sentence
      render 'new', layout: 'sign_up_flow'
    end
  end

  private

  def gift_params
    p = params.require(:gift).permit(:your_name, :your_email, :message, :their_email)
    p[:price] = @gift_price
    p
  end

  def payment_params
    {
      card_token: params[:stripeToken],
      product_id: 'season'
    }
  end

  def skip_signed_up_users
    redirect_to after_sign_in_path_for(current_user) if current_user.signed_up?
  end
end
