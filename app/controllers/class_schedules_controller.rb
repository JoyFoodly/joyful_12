class ClassSchedulesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_onboarding
  before_filter :set_season
  before_filter :authorize_user

  def show

  end

private

  def set_season
    @season = Season.current_season(session[:season_name])
  end

end
