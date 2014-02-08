class SeasonsController < ApplicationController

  def update
    season = Season.find_by!(name: season_params[:name])
    if current_user
      current_user.update_attributes(season: season)
    end
    session[:season_name] = season.name
    redirect_to :back
  end

private

  def season_params
    params.require(:season).permit(:name)
  end

end
