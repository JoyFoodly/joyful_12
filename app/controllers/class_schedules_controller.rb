class ClassSchedulesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_onboarding
  before_filter :authorize_user

  def show
    @season = Season.current_season(session[:season_name])
  end

private

  def authorize_user
    unless current_user.seasons.include?(@season)
      redirect_to page_path('no-access') and return
    end
  end

end
