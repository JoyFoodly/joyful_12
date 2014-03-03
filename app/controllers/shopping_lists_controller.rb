class ShoppingListsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_season, only: :edit

  def create
    @user = current_user
    recipe = Recipe.where(id: shopping_list_params[:recipe_ids]).first
    @shopping_list = ShoppingList::ListBuilder.call(@user, recipe)

    if @shopping_list.save
      redirect_to edit_shopping_list_path(@shopping_list), notice: 'Shopping list updated!'
    else
      redirect_to :back, notice: 'Sorry, something went wrong. Please try again in a few minutes.'
    end
  end

  def edit
    @user = current_user
    if params[:id] == 'current'
      @shopping_list = ShoppingList::ListBuilder.call(@user) if @shopping_list.nil?
    else
      @shopping_list = current_user.shopping_lists.includes(ingredient_list_items: [:ingredient]).find(params[:id])
    end
  end

  def update
    @shopping_list = ShoppingList.find(params[:id])
    @shopping_list.completed_at = Time.current if params[:archive].present?

    if @shopping_list.update(shopping_list_params)
      if params[:archive].present?
        redirect_to edit_user_path(@shopping_list), notice: 'Shopping list saved!'
      else
        redirect_to edit_shopping_list_path(@shopping_list), notice: 'Shopping list updated!'
      end
    else
      render :edit
    end
  end

private

  def shopping_list_params
    params.require(:shopping_list).permit(:name, recipe_ids: [])
  end

end
