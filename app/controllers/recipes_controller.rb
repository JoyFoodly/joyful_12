class RecipesController < ApplicationController

  def print_view
    @food = Food.find_by!(slug: params[:food_id])
    @recipe = @food.recipes.find(params[:recipe_id])
  end

end
