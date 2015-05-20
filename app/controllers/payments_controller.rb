class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :skip_signed_up_users

  def new
    @payment = Payment.new
    render layout: 'sign_up_flow'
  end

  def create
    @amount = 500

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charges_path
  end

  private

  def skip_signed_up_users
    redirect_to after_sign_in_path_for(current_user) if current_user.signed_up?
  end
end
