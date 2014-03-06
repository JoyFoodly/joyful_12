class ShoppingListEmailsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @user = current_user
    @shopping_list = ShoppingList.find(shopping_list_params[:shopping_list_id])
    Emailer.shopping_list(@user, @shopping_list).deliver
    redirect_to :back, notice: 'Shopping list emailed to you'
  end

private

  def shopping_list_params
    params.require(:shopping_list_email).permit(:shopping_list_id)
  end

end