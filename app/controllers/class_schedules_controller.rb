class ClassSchedulesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_onboarding

  def show
    @season = Season.current_season(session[:season_name])
  end

end
