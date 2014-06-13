FactoryGirl.define do
  sequence :slug do |n|
    "food-#{n}"
  end

  factory :food do
    name 'Great Food'
    slug
    season
  end
end
