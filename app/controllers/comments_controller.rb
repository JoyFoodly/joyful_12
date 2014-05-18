class CommentsController < ApplicationController
  layout false

  def index
    expires_in 1.hour, public: true
    @food = Food.includes(:recipes).find_by!(slug: params[:food_id])
    @recipe = @food.recipes.detect {|recipe| recipe.slug == params[:recipe_slug]}
  end

end
