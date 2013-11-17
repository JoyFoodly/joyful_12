# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

foods = %w[
Beets
Cauliflower
Pomegranate
Tangerine
Cabbage
Carrots
Fennel
Sweet potato
Apple
Broccoli
Winter Squash
Mushrooms
]

foods.each do |food|
  food = Food.find_or_create_by(name: food, slug: food.downcase.split(' ').join('-'))
  food.cooking_methods.find_or_create_by(name: 'Bake', description: "Bake the #{food.name}")
  food.cooking_methods.find_or_create_by(name: 'Mash', description: "Mash the #{food.name}")
  food.cooking_methods.find_or_create_by(name: 'Soup', description: "Make the #{food.name} into soup.")
end
