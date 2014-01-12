class CreateRecipesShoppingLists < ActiveRecord::Migration
  def change
    create_table :recipes_shopping_lists, id: false do |t|
      t.belongs_to :recipe,        null: false
      t.belongs_to :shopping_list, null: false
    end

    add_index :recipes_shopping_lists, [:recipe_id, :shopping_list_id]
  end
end
