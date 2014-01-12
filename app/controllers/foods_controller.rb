class FoodsController < ApplicationController

  def show
    @foods = Food.all
    @food = Food.includes(recipes: [:images]).find_by(slug: params[:id])
  end

end
