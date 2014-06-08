require 'spec_helper'

feature 'View food' do
  let(:user) { FactoryGirl.create(:onboarded_user) }
  before(:each) { sign_in(user) }

  scenario 'displays information about food' do
    food = FactoryGirl.create(:food, name: 'Spinach', slug: 'spring-spinach')
    user.seasons << food.season
    visit foods_path(food.slug)
    expect(page).to have_content(food.name)
  end

  scenario 'redirects users to no-access page if they do not belong to the season' do
    food = FactoryGirl.create(:food, name: 'Spinach', slug: 'spring-spinach')
    visit foods_path(food.slug)
    expect(page).to_not have_content(food.name)
  end
end
