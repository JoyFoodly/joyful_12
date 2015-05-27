class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :web_crawler_info
  
  # Overwriting the sign in and sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
  def after_sign_in_path_for(resource_or_scope)
    if !resource_or_scope.signed_up
      new_payment_path
    elsif !resource_or_scope.onboarded
      edit_user_path(current_user)
    else
      foods_path
    end
  end
  
  protected

  def ensure_onboarding
    redirect_to edit_user_path(current_user) and return unless current_user.onboarded?
  end

  def web_crawler_info
    if request.user_agent =~ /facebookexternalhit/
      render 'web_crawler/show', layout: false
    end
  end

  def model_specific_path(resource_or_scope)
    edit_user_path(resource_or_scope) if resource_or_scope.class == User
  end

  def authorize_user
    # If we are in admin scope then let's authorize all actions. - don't know how to do that in devise's multiple
    # scope arrangement, yet. 
    if !current_user.seasons.include?(@season)
      redirect_to upgrades_path and return
    end
  end

  def set_price
    if session[:partner_id] && c = Coupon.find_by_shareable_tag(session[:partner_id].downcase)
      @price = c.price.to_i

      if c.partners.size == 1
        @welcome_message = c.partners[0].welcome_message
      else
        @welcome_message = c.welcome_message
      end

      if c.gift_price
        @gift_price = c.gift_price.to_i
      else
        @gift_price = @price
      end
    else
      @welcome_message = ''
      @price = ENV['PRICE_PER_SEASON'].to_i
      @gift_price = @price
    end
  end
end
