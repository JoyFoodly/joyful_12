class HomeController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def confirmation_sent

  end

  def page
    # Handle specific slugs
    if /^\/about/.match(request.fullpath)
      if session[:partner_id] && c=Coupon.find_by_shareable_tag(session[:partner_id].downcase)
        # if the coupon is used by just one partner, use that partner's welcome message, else
        # use the coupon's welcome message.
        @price = c.price.to_i
        if c.partners.size == 1
          @welcome_message = c.partners[0].welcome_message
        else
          @welcome_message = c.welcome_message
        end
      else
        @welcome_message = ''
        @price=ENV['PRICE_PER_SEASON'].to_i
      end
  
      render 'about', layout: 'qubico'
    else
      # Unknown slug - go to root page - purists would insist this should be a 404.
      rootpage
    end
  end
  
  def rootpage
    if session[:partner_id] && c=Coupon.find_by_shareable_tag(session[:partner_id].downcase)
      # if the coupon is used by just one partner, use that partner's welcome message, else
      # use the coupon's welcome message.
      @price = c.price.to_i
      if c.partners.size == 1
        @welcome_message = c.partners[0].welcome_message
      else
        @welcome_message = c.welcome_message
      end
    else
      @welcome_message = ''
      @price=ENV['PRICE_PER_SEASON'].to_i
    end

    @price_in_dollars = number_to_currency(@price/100, precision: 0)
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
