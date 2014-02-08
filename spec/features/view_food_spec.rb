require 'spec_helper'

feature 'View food' do
  scenario 'displays information about food' do
    api_url = 'http://api.yummly.com/v1/api/recipes?_app_id=4961b074&_app_key=26a79539c2717a4de590420b6a89b238&q=Cauliflower'
    stub_request(:get, api_url).to_return(:status => 200, :body => { matches: [] }.to_json, :headers => {})
    foot = Food.create(name: 'Cauliflower', slug: 'cauliflower')
    visit root_url
    click_link 'cauliflower'
    expect(page).to have_content('Other great cauliflower recipes from around the web:')
  end
end
