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
    <img src='/assets/cooking-methods/cauliflower-roasted1-a4de0d5ed0925f28f481ef2fe7c193fc.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    In a bowl, toss cauliflower florets with 2 tablespoons olive oil, and two teaspoons of salt. We also like
    to add a teaspoon of a spice, like cumin or curry powder at this point. Toss well.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-roasted2-469bd569ce3fdb13127a891bcb577810.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Distribute evenly on a cookie sheet, allowing some space between the florets.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-roasted3-d5db82fb250a690983a7cbd0b81b3455.jpg' class='img-responsive' />
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
  <div class="col-md-3"><p class='teal'>Prep: 8 min.</p></div>
  <div class="col-md-3"><p class='teal'>Cook: 10 min.</p></div>
</div>
<p>Ingredients: 1 medium head cauliflower, trimmed and cut into small florets / 1 tablespoon extra virgin olive oil /
  1 tablespoon butter / 1 teaspoon of salt and 1/4 teaspoon of black pepper / 1/4 cup milk / Optional: chives to garnish</p>
<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-mashed1-9453a65b1abf449a1692dbe3ce419a03.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Bring water to a boil in the pot you use to steam vegetables.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-mashed2-9d5cbb99ef504c247f8e72f44f5b5f96.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Place cauliflower florets into the steamer basket and place in the pot; lower temperature to medium-low,
    and cover the pot.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-mashed3-22577398516d3cb4343b726ca03390b9.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Let cook 10-12 minutes. It’s done when you can easily insert a knife into the floret.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-mashed4-cd6f488a229e6967eb9a2a9da2261ce3.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Transfer cauliflower to a food processor or blender.
    Add oil, butter, milk, salt and pepper and puree until smooth.  Garnish with chives.
  </div>
</div>
}

soup_instructions = %Q{
<div class='row'>
  <div class="col-md-6"><p class='inline-header'>Mashed Cauliflower</p></div>
  <div class="col-md-3"><p class='teal'>Prep: 9 min.</p></div>
  <div class="col-md-3"><p class='teal'>Cook: 12 min.</p></div>
</div>
<p>Ingredients: 1 head cauliflower (cut into florets) / 4 tablespoons olive oil / 3 teaspoons salt /
  1 tablespoon curry powder / 1 white onion, diced / 1 quart vegetable broth / **Optional: ⅛ cup heavy cream to finish</p>
<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-soup1-d5db82fb250a690983a7cbd0b81b3455.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Preheat oven to 400F. Cut cauliflower into florets. See our technique timeout on how to cut cauliflower here.
    Toss cauliflower with 2 tablespoons of olive oil and 2 teaspoons salt. Roast on a parchment lined cookie
    sheet for 15 minutes.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-soup2-d2c81c20ba4e23bb6a7f936559ca87f3.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    In a tall soup pot, heat the curry powder and 2 tablespoons olive oil on medium-low. This will allow the curry
    powder to "bloom" or draw out its rich flavor. Add diced onion and 1 teaspoon of salt and saute
    on medium-high heat for 2-3 minutes.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-soup3-f85700dc500040548ac840c719972b62.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Add roasted cauliflower florets, mix together with other ingredients in pot. Add vegetable broth;
    just enough to barely cover ingredients in pot. Note: you may not need the whole quart of broth,
    depending on the size of the cauliflower you are using.
  </div>
</div>

<div class='row bottom-buffer'>
  <div class='col-md-4'>
    <img src='/assets/cooking-methods/cauliflower-soup4-1968324dd79d07c158e5727e1be0f4ba.jpg' class='img-responsive' />
  </div>
  <div class='col-md-8'>
    Bring to a boil; at the point the soup begins to boil, turn back down to a simmer, cover and let cook 10 minutes.
    Cool slightly before transferring all ingredients to your blender. Purée the soup in your blender. Taste for
    seasoning (salt and pepper). Optional: add heavy cream and blend to incorporate.
  </div>
</div>
}

foods.each do |food|
  food = Food.find_or_create_by(name: food, slug: food.downcase.split(' ').join('-'))
  food.cooking_methods.find_or_create_by(name: 'Roast', instructions: roast_instructions)
  food.cooking_methods.find_or_create_by(name: 'Mash', instructions: mash_instructions)
  food.cooking_methods.find_or_create_by(name: 'Soup', instructions: soup_instructions)
end
