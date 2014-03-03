class FoodsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_season
  before_filter :set_foods
  before_filter :authorize_user

  def index
    first_food = @foods.to_a.min { |a, b| a.sort_order <=> b.sort_order }
    @food = Food.includes(:video_links, recipes: [:images, :dietary_categories, :child_recipes, ingredient_list_items: [:ingredient]]).find(first_food.id)
    @child_recipes = @food.recipes.map(&:child_recipes).flatten
    render :show
  end

  def show
    @food = Food.includes(:video_links, recipes: [:images, :dietary_categories, :child_recipes, ingredient_list_items: [:ingredient]]).find_by!(slug: params[:id])
    @child_recipes = @food.recipes.map(&:child_recipes).flatten
  end

private

  def set_foods
    @foods = @season.foods
  end

  def authorize_user
    if @foods.empty?
      redirect_to page_path('no-access') and return
    end
  end

end
