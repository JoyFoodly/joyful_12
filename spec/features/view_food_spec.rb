require 'spec_helper'

feature 'View food' do
  let(:user) { FactoryGirl.create(:onboarded_user) }
  before(:each) { sign_in(user) }

  scenario 'displays information about food' do
    api_url = 'http://api.yummly.com/v1/api/recipes?_app_id=4961b074&_app_key=26a79539c2717a4de590420b6a89b238&q=Cauliflower'
    stub_request(:get, api_url).to_return(:status => 200, :body => { matches: [] }.to_json, :headers => {})
    food = FactoryGirl.create(:food, name: 'Spinach', slug: 'spring-spinach')
    Season.stub(current_season: food.season)
    visit foods_path('spring-spinach')
    expect(page).to have_content('Spinach')
  end
end
