class FoodsController < ApplicationController

  def show
    @foods = Food.all
    @food = Food.find_by(slug: params[:id])
  end

end
