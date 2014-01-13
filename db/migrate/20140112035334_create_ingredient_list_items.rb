class CreateIngredientListItems < ActiveRecord::Migration
  def change
    create_table :ingredient_list_items do |t|
      t.string :quantity,       null: false, default: ''
      t.integer :sort_order,    null: false, default: 0
      t.belongs_to :ingredient, null: false
      t.belongs_to :recipe,     null: false

      t.timestamps              null: false
    end

    add_index :ingredient_list_items, [:ingredient_id, :recipe_id]
  end
end
