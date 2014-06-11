class ShoppingList < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :recipes
  has_many :ingredient_list_items, through: :recipes

  # Adding a scope for current list
  def self.current_list 
    where(completed_at: nil)
  end

  def self.saved_lists
    where.not(completed_at: nil).order(created_at: :desc)
  end
end
