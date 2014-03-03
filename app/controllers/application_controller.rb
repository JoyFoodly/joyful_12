class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected

  def set_season
    session[:season_name] ||= Season.current_season_name
    @season = Season.current_season(current_user, session[:season_name])
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || model_specific_path(resource_or_scope) || signed_in_root_path(resource_or_scope)
  end

  def model_specific_path(resource_or_scope)
    edit_user_path(resource_or_scope) if resource_or_scope.class == User
  end

end
