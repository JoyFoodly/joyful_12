class AddOptionalToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :optional, :boolean, null: false, default: false
  end
end
