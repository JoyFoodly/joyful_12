# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

avocado = Food.find_or_create_by(name: 'Avocado', slug: 'avocado')
cauliflower = Food.find_or_create_by(name: 'Cauliflower', slug: 'cauliflower')
bake = cauliflower.cooking_methods.find_or_create_by(name: 'Bake', description: "Bake the #{avocado.name}")
mash = cauliflower.cooking_methods.find_or_create_by(name: 'Mash', description: "Mash the #{avocado.name}")
soup = cauliflower.cooking_methods.find_or_create_by(name: 'Soup', description: "Make the #{avocado.name} into soup.")
