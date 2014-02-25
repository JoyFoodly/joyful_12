class IngredientListItem < ActiveRecord::Base
  has_paper_trail
  belongs_to :recipe
  belongs_to :ingredient
end
