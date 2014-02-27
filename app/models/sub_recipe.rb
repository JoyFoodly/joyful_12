class SubRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :child_recipe, class_name: 'Recipe'

  validates :recipe_id, presence: true
  validates :child_recipe_id, presence: true
end
