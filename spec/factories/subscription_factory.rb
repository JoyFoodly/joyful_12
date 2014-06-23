FactoryGirl.define do
  factory :subscription do
    card_token 'KUYGHT'
    plan_id 'season'
    user
  end
end
