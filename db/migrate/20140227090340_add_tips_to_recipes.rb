class AddTipsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :tips, :text
  end
end
