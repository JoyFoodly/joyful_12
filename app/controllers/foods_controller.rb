class FoodsController < ApplicationController

  def show
    @foods = Food.all
    @food = Food.includes(recipes: [:images, ingredient_list_items: [:ingredient]]).find_by(slug: params[:id])
  end

end
