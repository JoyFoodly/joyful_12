module ApplicationHelper

  def season_name
    session[:season_name] || Season.current_season_name
  end

end
