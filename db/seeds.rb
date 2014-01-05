# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Admin.find_or_create_by(email: 'michelle.ann.harvey@gmail.com')
admin.password = 'password' unless admin.persisted?
admin.save

foods = [
'Beet',
'Cauliflower',
'Pomegranate',
'Tangerine',
'Cabbage',
'Carrot',
'Fennel',
'Sweet potato',
'Apple',
'Broccoli',
'Winter Squash',
'Collard',
]

easy_recipe_attributes = {
  title: 'Roasted Cauliflower',
  subtitle: 'Cauliflower recipe 1 - easy',
  prep_time: '10 min',
  cook_time: '15 min',
  serving_size: '4 - 6 people',
  difficulty: 'easy',
  instructions: %q{
### Ingredients:

* 1 head cauliflower
* 2 tsp salt
* 2 TBS olive oil
* optional spices: cumin, curry powder, tumeric.

### Directions:

1. In a bowl, toss cauliflower florets with 2 tablespoons olive oil, and two teaspoons of salt. We also like
   to add a teaspoon of a spice, like cumin or curry powder at this point. Toss well.

1. Distribute evenly on a cookie sheet, allowing some space between the florets.

1. Put in the oven. Check at 10 minutes. When the florets start to brown, flip cauliflower over.
   Continue cooking cauliflower until it is crisp tender and slightly browned all over, about 15-20 minutes.
  }
}

foods.each do |food|
  food = Food.find_or_create_by(name: food, slug: food.downcase.split.join('-'))
  food.recipes.find_or_create_by(easy_recipe_attributes)
end

['Gluten Free', 'Dairy Free'].each { |allergy_name| Allergy.create!(name: allergy_name) }
