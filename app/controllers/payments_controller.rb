class PaymentsController < ApplicationController

  before_action :authenticate_user!
  before_action :skip_signed_up_users

  def new
    set_price
    render layout: 'sign_up_flow'
  end

  def create
    @payment = current_user.payments.build(
      card_token: params[:stripeToken],
      product_id: 'season'
    )
    if @payment.valid?
      ActiveRecord::Base.transaction do
        @payment.save
        current_user.update(signed_up: true)
      end
      redirect_to after_sign_in_path_for(current_user)
    else
      flash[:alert] = @payment.errors[:base].join(' ')
      render 'new', layout: 'sign_up_flow'
    end
  end

  private

  def skip_signed_up_users
    redirect_to after_sign_in_path_for(current_user) if current_user.signed_up?
  end
end
