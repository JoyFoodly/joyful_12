class Ingredient < ActiveRecord::Base
  has_paper_trail
  has_many :ingredient_list_items
  has_many :recipes, through: :ingredient_list_items

  validates :name,     presence: true
  validates :category, presence: true
end
