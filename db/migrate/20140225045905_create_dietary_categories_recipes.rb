class CreateDietaryCategoriesRecipes < ActiveRecord::Migration
  def change
    create_table :dietary_categories_recipes, id: false do |t|
      t.belongs_to :dietary_category, null: false
      t.belongs_to :recipe,           null: false
    end

    add_index :dietary_categories_recipes, [:dietary_category_id, :recipe_id], name: 'index_dietary_categories_recipes_on_category_and_recipe'
  end
end
