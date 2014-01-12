class ShoppingList::ListBuilder

  attr_reader :user, :recipe
  def initialize(user, recipe)
    @user   = user
    @recipe = recipe
  end

  def self.call(user, recipe)
    new(user, recipe).build_list
  end

  def build_list
    list = user.shopping_lists.find_or_create_by!(completed_at: nil)
    list.recipes << recipe if recipe.present? && !list.recipes.include?(recipe)
    list
  end

end
