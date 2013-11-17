# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

roast_instructions = %Q{
<div class='row'>
  <div class="col-md-6"><p class='inline-header'>Roasted Cauliflower</p></div>
  <div class="col-md-3"><p class='teal'>Prep: 10 min.</p></div>
  <div class="col-md-3"><p class='teal'>Cook: 15 min.</p></div>
</div>
<p>Ingredients: 1 head cauliflower / 2 tsp salt / 2 TBS olive oil / optional spices: cumin, curry powder, tumeric.</p>
<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-roasted1-d175d730f8a92baa0bd40f5d6c323813.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    In a bowl, toss cauliflower florets with 2 tablespoons olive oil, and two teaspoons of salt. We also like
    to add a teaspoon of a spice, like cumin or curry powder at this point. Toss well.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-roasted2-c7bc1e29ea33ded2b05181b5f3e0c6ef.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Distribute evenly on a cookie sheet, allowing some space between the florets.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-roasted3-6ba4a241305e805427994e48d693b54d.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Put in the oven. Check at 10 minutes. When the florets start to brown, flip cauliflower over.
    Continue cooking cauliflower until it is crisp tender and slightly browned all over, about 15-20 minutes.
  </div>
</div>
}

mash_instructions = %Q{
<div class='row'>
  <div class="col-md-6"><p class='inline-header'>Mashed Cauliflower</p></div>
  <div class="col-md-3"><p class='teal'>Prep: 10 min.</p></div>
  <div class="col-md-3"><p class='teal'>Cook: 10 min.</p></div>
</div>
<p>Ingredients: 1 medium head cauliflower, trimmed and cut into small florets / 1 tablespoon extra virgin olive oil /
  1 tablespoon butter / 1 teaspoon of salt and 1/4 teaspoon of black pepper / 1/4 cup milk / Optional: chives to garnish</p>
<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-mashed1-d00ea8fb076893a27cea3dc364103588.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Bring water to a boil in the pot you use to steam vegetables.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-mashed2-131101907390c47471586ff9691e464a.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Place cauliflower florets into the steamer basket and place in the pot; lower temperature to medium-low,
    and cover the pot.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-mashed3-94517042f37f0efc1c014eec1a23a44f.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Let cook 10-12 minutes. It’s done when you can easily insert a knife into the floret.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-mashed4-814abfcfa90e9ae08c790e5c74055b82.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Transfer cauliflower to a food processor or blender.
    Add oil, butter, milk, salt and pepper and puree until smooth.  Garnish with chives.
  </div>
</div>
}

foods.each do |food|
  food = Food.find_or_create_by(name: food, slug: food.downcase.split(' ').join('-'))
  food.cooking_methods.find_or_create_by(name: 'Roast', instructions: roast_instructions)
  food.cooking_methods.find_or_create_by(name: 'Mash', instructions: mash_instructions)
  food.cooking_methods.find_or_create_by(name: 'Soup', instructions: "Make the #{food.name} into soup.")
end
