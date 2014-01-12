class ShoppingListsController < ApplicationController
  before_filter :authenticate_user!

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
    @shopping_list = current_user.shopping_lists.find(params[:id])
  end

  def update
    @shopping_list = ShoppingList.find(params[:id])

    if @shopping_list.update(shopping_list_params)
      redirect_to edit_shopping_list_path(@shopping_list), notice: 'Shopping list updated!'
    else
      render :edit
    end
  end

private

  def shopping_list_params
    params.require(:shopping_list).permit(:name, recipe_ids: [])
  end

end
