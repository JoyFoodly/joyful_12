class HomeController < ApplicationController
  include ActionView::Helpers::NumberHelper
  def confirmation_sent

  end

  def page
    # Handle specific slugs
    if /^\/about/.match(request.fullpath)
      set_price
      render 'about', layout: 'qubico'
    else
      # Unknown slug - go to root page - purists would insist this should be a 404.
      rootpage
    end
  end
  
  def rootpage
    set_price
    render layout: 'plain'
  end

  def marketing
    # Enable marketing slugs
    if params[:tracking_slug]=='clear'
      session[:partner_id]=nil
    else
      session[:partner_id]=params[:tracking_slug]
    end
    redirect_to :root
  end
end
