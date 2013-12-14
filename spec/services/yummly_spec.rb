require 'spec_helper'

describe Yummly do
  describe '.search' do
    it 'searches the Yummly API for the given term' do
      stub_request(:get, "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['YUMMLY_APP_ID']}&_app_key=#{ENV['YUMMLY_APP_KEY']}&q=yummly%20term").
          to_return(:status => 200, :body => {matches: []}.to_json, :headers => {})
      expect(Yummly.search('yummly term')).to eq([] )
    end

    it 'returns an empty array on error' do
      stub_request(:get, "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['YUMMLY_APP_ID']}&_app_key=#{ENV['YUMMLY_APP_KEY']}&q=yummly%20term").
          to_return(:status => 404, :body => '', :headers => {})
      expect(Yummly.search('yummly term')).to eq([] )
    end
  end

  describe '.find' do
    it 'finds the yummly recipe via the API' do
      stub_request(:get, "http://api.yummly.com/v1/api/recipe/yummly-id?_app_id=#{ENV['YUMMLY_APP_ID']}&_app_key=#{ENV['YUMMLY_APP_KEY']}").
          to_return(:status => 200, :body => {}.to_json, :headers => {})
      expect(Yummly.find('yummly-id')).to be_instance_of(Yummly::SearchResult)
    end

    it 'returns an empty search result on error' do
      stub_request(:get, "http://api.yummly.com/v1/api/recipe/yummly-id?_app_id=#{ENV['YUMMLY_APP_ID']}&_app_key=#{ENV['YUMMLY_APP_KEY']}").
          to_return(:status => 404, :body => '', :headers => {})
      expect(Yummly.find('yummly-id')).to be_instance_of(Yummly::SearchResult)
    end
  end

  #it 'should have a list lf allowed allergies' do
  #  expect(Yummly.const_get('ALLOWED_ALLERGIES')).to_not be_empty
  #  expect(Yummly::ALLOWED_ALLERGIES['Wheat-Free']).to eq('392^Wheat-Free')
  #end
end

describe Yummly::SearchResult do
  describe '#id' do
    it 'returns the yummly id' do
      expect(Yummly::SearchResult.new('id' => 'yummly-id').id).to eq('yummly-id')
    end
  end

  describe '#image' do
    it 'returns the first yummly small image url' do
      expect(Yummly::SearchResult.new('smallImageUrls' => ['yummly-image-url']).image).to eq('yummly-image-url')
    end
  end

  describe '#recipe_name' do
    it 'returns the yummly recipe name' do
      expect(Yummly::SearchResult.new('recipeName' => 'yummly-recipe-name').recipe_name).to eq('yummly-recipe-name')
    end
  end

  describe '#source_name' do
    it 'returns the yummly source name' do
      expect(Yummly::SearchResult.new('sourceDisplayName' => 'yummly-display-name').source_name).to eq('yummly-display-name')
    end
  end

  describe '#source_url' do
    it 'returns the yummly source URL' do
      expect(Yummly::SearchResult.new('source' => { 'sourceRecipeUrl' => 'yummly-recipe-url'}).source_url).to eq('yummly-recipe-url')
    end
  end
end
