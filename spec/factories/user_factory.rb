FactoryGirl.define do
  factory :user do
    username 'james_deen'
    email 'jamesdeen@example.com'
    first_name 'James'
    last_name 'Deen'
    password 'secretpass'
    confirmed_at { 1.minute.ago }
    onboarded true

    factory :invalid_user do
      email nil
    end
  end
end
