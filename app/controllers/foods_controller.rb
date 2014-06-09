class FoodsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_onboarding
  before_filter :set_food, only: :show
  before_filter :set_season
  before_filter :set_foods
  before_filter :authorize_user

  def index
    expires_in 10.minutes, public: false
    first_food = @foods.to_a.min { |a, b| a.sort_order <=> b.sort_order }
    @food = Food.includes(:video_links, recipes: [:images, :dietary_categories, :child_recipes, ingredient_list_items: [:ingredient]]).find(first_food.id)
    @child_recipes = @food.recipes.map(&:child_recipes).flatten
    render :show
  end

  def show
    expires_in 10.minutes, public: false
    @child_recipes = @food.recipes.map(&:child_recipes).flatten
  end

private

  def set_food
    food_includes = [:video_links, recipes: [:images, :dietary_categories, :child_recipes, ingredient_list_items: [:ingredient]]]
    @food = Food.includes(food_includes).find_by!(slug: params[:id])
  end

  def set_season
    if @food.present?
      @season = @food.season
      session[:season_name] = @season.name
    else
      session[:season_name] ||= current_user.try(:season).try(:name) || Season.current_season_name

      @season = Season.current_season(session[:season_name])
    end
  end

  def set_foods
    @foods = @season.foods
  end

  def authorize_user
    if !current_user.seasons.include?(@season) || @foods.empty?
      redirect_to page_path('no-access') and return
    end
  end

end
