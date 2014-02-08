class FoodsController < ApplicationController
  before_filter :set_season
  before_filter :set_foods

  def index
    first_food = @foods.to_a.min {|food| food.sort_order }
    @food = Food.includes(recipes: [:images, ingredient_list_items: [:ingredient]]).find(first_food.id)
    render :show
  end

  def show
    @food = Food.includes(recipes: [:images, ingredient_list_items: [:ingredient]]).find_by!(slug: params[:id])
  end

private

  def set_season
    @season = Season.current_season(current_user, session[:season_name])
  end

  def set_foods
    @foods = @season.foods
  end

end
