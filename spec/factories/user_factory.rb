FactoryGirl.define do
  factory :user do
    email 'jamesdeen@example.com'
    first_name 'James'
    last_name 'Deen'
    password 'secretpass'
    confirmed_at { 1.minute.ago }
  end
end
