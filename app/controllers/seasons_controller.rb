class SeasonsController < ApplicationController
  before_filter :authenticate_user!

  def update
    season = Season.find_by!(name: season_params[:name])
    if current_user
      current_user.update_attributes(season: season)
    end
    session[:season_name] = season.name
    redirect_back_unless_recipe_page
  end

private

  def season_params
    params.require(:season).permit(:name)
  end

  def redirect_back_unless_recipe_page
    if request.referrer =~ /#{foods_path}\/\w+/ || request.referrer =~ /no-access/
      redirect_to foods_path
    else
      redirect_to :back
    end
  end

end
