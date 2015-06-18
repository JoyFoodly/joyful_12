class ContactFormsController < ApplicationController

  def create
    Emailer.contact_form(params[:name], params[:email], params[:subject], params[:message]).deliver_now
    head :ok
  end

end
