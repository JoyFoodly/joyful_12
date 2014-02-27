class CreateSubRecipes < ActiveRecord::Migration
  def change
    create_table :sub_recipes do |t|
      t.belongs_to :recipe,        null: false
      t.belongs_to :child_recipe,  null: false

      t.timestamps null: false
    end

    add_index :sub_recipes, [:recipe_id, :child_recipe_id]
  end
end
