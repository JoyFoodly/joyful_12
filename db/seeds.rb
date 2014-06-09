# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create_with(password: 'password').find_or_create_by!(email: 'michelle.ann.harvey@gmail.com')

user_attributes = { first_name: 'Tester', last_name: 'Person', password: 'password', created_at: Time.current }
user = User.create_with(user_attributes).find_or_create_by!(email: 'test@example.com')
user.confirm!

test_user = user

easy_recipe_attributes = {
    title: 'Roasted Cauliflower',
    subtitle: 'Cauliflower recipe 1 - easy',
    prep_time: '10 min',
    cook_time: '15 min',
    serving_size: '4 - 6 people',
    difficulty: 'easy',
    instructions: %q{
1. In a bowl, toss cauliflower florets with 2 tablespoons olive oil, and two teaspoons of salt. We also like
   to add a teaspoon of a spice, like cumin or curry powder at this point. Toss well.

1. Distribute evenly on a cookie sheet, allowing some space between the florets.

1. Put in the oven. Check at 10 minutes. When the florets start to brown, flip cauliflower over.
   Continue cooking cauliflower until it is crisp tender and slightly browned all over, about 15-20 minutes.
  }
}


spring_foods = [["Avocado", "spring-avocado"],
                ["Potato", "spring-potato"],
                ["Strawberry", "spring-strawberry"],
                ["Artichoke", "spring-artichoke"],
                ["Peas", "spring-peas"],
                ["Asparagus", "spring-asparagus"],
                ["Radishes", "spring-radish"],
                ["Fennel", "spring-fennel"],
                ["Green Onion", "spring-green-onion"],
                ["Spinach", "spring-spinach"],
                ["greens", "spring-greens"],
                ["rhubarb", "spring-rhubarb"]]

spring_season = Season.find_or_create_by(name: 'Spring')
spring_foods.each do |name, slug|
  food = Food.find_or_create_by(name: name, slug: slug, season: spring_season)
  food.recipes.find_or_create_by(easy_recipe_attributes.merge(title: "#{spring_season.name} Roasted #{food.name}" ))
end

# Test user is a Spring user
test_user.seasons << spring_season

winter_foods = [["Sweet Potato", "winter-sweet-potato"],
                ["Brussels Sprout", "winter-brussels-sprout"],
                ["Winter Squash", "winter-winter-squash"],
                ["Citrus", "winter-citrus"],
                ["Greens", "winter-greens"],
                ["Beet", "winter-beets"]]

winter_season = Season.find_or_create_by(name: 'Winter')
winter_foods.each do |name, slug|
  food = Food.find_or_create_by(name: name, slug: slug, season: winter_season)
  food.recipes.find_or_create_by(easy_recipe_attributes.merge(title: "#{winter_season.name} Roasted #{food.name}" ))
end



foods = ["Fennel", "Avocado", "Potato", "Strawberry", "Spinach", "Artichoke", "Peas", "Asparagus", "Green Onions",
         "Radish", "mystery", "mystery 2"]

ingredients = [['Cauliflower', 'Produce', '1 head', 0],
               ['Salt', 'Other', '2 tsp', 2],
               ['Olive Oil', 'Other', '2 tbs', 1]]

seasons = %w[Summer Fall].map { |name| Season.find_or_create_by(name: name) }
seasons.each do |season|
  foods.each do |food|
    food = Food.find_or_create_by(name: food, slug: season.name.downcase + '-' + food.downcase.split.join('-'), season: season)
    recipe = food.recipes.find_or_create_by(easy_recipe_attributes.merge(title: "#{season.name} Roasted #{food.name}" ))
    ingredients.each do |ingredient_name, category, quantity, sort_order|
      ingredient = Ingredient.find_or_create_by!(name: ingredient_name, category: category)
      recipe.ingredient_list_items.find_or_create_by!(ingredient_id: ingredient.id, quantity: quantity, sort_order: sort_order)
    end
  end
end

['Gluten Free', 'Dairy Free'].each { |allergy_name| Allergy.find_or_create_by!(name: allergy_name) }
