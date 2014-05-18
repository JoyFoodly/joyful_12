class CommentThreadSourcesController < ApplicationController
  before_filter :redirect_to_foods_page, unless: :comments_crawler
  layout false

  def show
    @food = Food.includes(:recipes).find_by!(slug: params[:food_id])
    @recipe = @food.recipes.detect {|recipe| recipe.slug == params[:recipe_slug]}
  end

private

  def redirect_to_foods_page
    redirect_to "#{food_path(params[:food_id])}##{params[:recipe_slug]}" and return
  end

  def comments_crawler
    request.env['HTTP_X_FORWARDED_FOR'] =~ Regexp.new(ENV['COMMENTS_CRAWLER_IP_ADDRESS'])
  end

end
