FactoryGirl.define do
  factory :user do
    email 'jamesdeen@example.com'
    first_name 'James'
    last_name 'Deen'
    zip_code '98125'
    password 'secretpass'
  end
end
