class Yummly
  ALLOWED_ALLERGIES = {
      "Wheat-Free"    => "392^Wheat-Free",
      "Gluten-Free"   => "393^Gluten-Free",
      "Peanut-Free"   => "394^Peanut-Free",
      "Tree Nut-Free" => "395^Tree Nut-Free",
      "Dairy-Free"    => "396^Dairy-Free",
      "Egg-Free"      => "397^Egg-Free",
      "Seafood-Free"  => "398^Seafood-Free",
      "Sesame-Free"   => "399^Sesame-Free",
      "Soy-Free"      => "400^Soy-Free",
      "Sulfite-Free"  => "401^Sulfite-Free"
  }



  class SearchResult < Struct.new(:search_result_json)
    def id
      search_result_json['id']
    end

    def image
      search_result_json['smallImageUrls'].try('first')
    end

    def recipe_name
      search_result_json['recipeName']
    end

    def source_name
      search_result_json['sourceDisplayName']
    end

    def source_url
      search_result_json['source']['sourceRecipeUrl']
    end
  end

  attr_reader :term, :options
  def initialize(term, options)
    @term = term
    @options = options
  end

  def self.find(yummly_id)
    SearchResult.new(new(yummly_id, {}).send(:yummly_find_response))
  end

  def self.search(term, options = {})
    new(term, options).search_results
  end

  def search_results
    yummly_search_response.map { |search_result_json| SearchResult.new(search_result_json) }
  end

private

  def yummly_search_response
    res = Faraday.get('http://api.yummly.com/v1/api/recipes', _app_id: app_id, _app_key: app_key, q: term, allowedAllergy: Array(options[:allergy]))
    if res.success?
      JSON.parse(res.body)['matches']
    else
      []
    end
  end

  def yummly_find_response
    res = Faraday.get("http://api.yummly.com/v1/api/recipe/#{term}", _app_id: app_id, _app_key: app_key)
    if res.success?
      JSON.parse(res.body)
    else
      {}
    end
  end

  def app_id
    ENV['YUMMLY_APP_ID']
  end

  def app_key
    ENV['YUMMLY_APP_KEY']
  end

end
