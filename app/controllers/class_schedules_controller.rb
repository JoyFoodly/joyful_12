class ClassSchedulesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @season = Season.current_season(current_user, session[:season_name])
  end

end
