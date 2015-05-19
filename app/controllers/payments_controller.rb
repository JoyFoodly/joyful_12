class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
    render layout: 'sign_up_flow'
  end
end
