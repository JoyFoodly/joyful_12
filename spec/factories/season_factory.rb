FactoryGirl.define do
  factory :season do
    name Season.current_season_name
  end
end
