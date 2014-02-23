class RemoveSubtitleRequirementFromRecipes < ActiveRecord::Migration
  def up
    change_column :recipes, :subtitle, :string, default: '', null: true
  end

  def down
    change_column :recipes, :subtitle, :string, default: '', null: false
  end
end
