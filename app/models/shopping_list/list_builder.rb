class ShoppingList::ListBuilder

  attr_reader :user, :recipe
  def initialize(user, recipe)
    @user   = user
    @recipe = recipe
  end

  def self.call(user, recipe = nil)
    new(user, recipe).build_list
  end

  def build_list
    list = user.shopping_lists.includes(ingredient_list_items: [:ingredient])
                              .create_with(name: default_name)
                              .find_or_create_by!(completed_at: nil)
    if recipe.present? && !list.recipes.include?(recipe)
      list.recipes << recipe
      recipe.child_recipes.each do |child_recipe|
        list.recipes << child_recipe
      end
    end
    list
  end

  def default_name
    "#{Date.current.strftime('%D')} Shopping List"
  end

end
