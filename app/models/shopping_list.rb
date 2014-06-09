class ShoppingList < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :recipes
  has_many :ingredient_list_items, through: :recipes
end
