FactoryGirl.define do
  factory :recipe do
    title 'Awesome recipe #1'
    subtitle 'Best recipe for kids'
    prep_time '12 min'
    cook_time '10 min'
    serving_size '5'
    difficulty 'easy'
    instructions 'Cook the food, eat the food.'
    food
  end
end
