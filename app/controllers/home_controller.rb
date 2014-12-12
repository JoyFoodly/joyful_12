class HomeController < ApplicationController

  def confirmation_sent

  end

  def marketing
    # Enable marketing slugs
    session[:partner_id]=params[:tracking_slug]
    redirect_to :root
  end
end
