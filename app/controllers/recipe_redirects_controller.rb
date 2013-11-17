class RecipeRedirectsController < ApplicationController

  def show
    redirect_to Yummly.find(params[:id]).source_url
  end

end
