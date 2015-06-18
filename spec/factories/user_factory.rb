FactoryGirl.define do
  factory :user do
    username 'james_deen'
    email 'jamesdeen@example.com'
    first_name 'James'
    last_name 'Deen'
    password 'secretpass'
    confirmed_at { 1.minute.ago }
    onboarded true
    signed_up true

    factory :invalid_user do
      email nil
    end

    factory :unpaid_user do
      signed_up false
      onboarded false
    end
  end
end
