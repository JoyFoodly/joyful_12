require 'spec_helper'

feature 'Add recipe to shopping lists' do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe) }
  before(:each) do
    sign_in(user)
    user.seasons << recipe.food.season
  end

  scenario 'allows users to add recipes to their current list' do
    visit edit_shopping_list_path('current')
    select recipe.title, from: "add_recipe_select"
    click_button 'Add Recipe'
    expect(user.shopping_lists.first.recipes).to include(recipe)
  end

  scenario 'allows users to add recipes to an archived list' do
    shopping_list = user.shopping_lists.create!(recipe_ids: [recipe.id], completed_at: Time.current)
    second_recipe = create(:recipe, title: 'Second Awesome Recipe', food_id: recipe.food_id)
    visit edit_shopping_list_path(shopping_list)
    expect(page).to have_content(second_recipe.title)
    select second_recipe.title, from: "add_recipe_select"
    click_button 'Add Recipe'
    expect(shopping_list.recipes.reload).to eq([recipe, second_recipe])
  end

end
