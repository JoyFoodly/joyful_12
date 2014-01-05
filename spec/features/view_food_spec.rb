require 'spec_helper'

feature 'View food' do
  scenario 'displays information about food' do
    api_response = { matches: [] }
    stub_request(:get, "http://api.yummly.com/v1/api/recipes?_app_id=4961b074&_app_key=26a79539c2717a4de590420b6a89b238&q=Cauliflower").
        to_return(:status => 200, :body => api_response.to_json, :headers => {})
    foot = Food.create(name: 'Cauliflower', slug: 'cauliflower')
    visit root_url
    click_link 'cauliflower'
    expect(page).to have_content('Joyful 12 Recipes:')
  end
end
