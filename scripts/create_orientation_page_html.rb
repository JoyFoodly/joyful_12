season = 'winter'
foods = Food.where('slug like ?', "#{season}-%")
recipe_info = foods.map do |food|
  a = {slug: food.slug, alt: "#{food.name}"}.merge(food.images.size > 0 ? {url_loc: food.images[0].file.url} : {url_loc: 'http://www.google.com/'})
end

final_str = ''
recipe_info.each do |rec|
  final_str += "<div class=\"col-lg-3 col-md-6 col-xs-12 bottom-padding\">
    <a href=\"/classroom/#{rec[:slug]}\" class=\"image-text-link\">
      <img class='wiggle centered' alt=\"#{rec[:alt]}\" src=\"#{rec[:url_loc]}\"/>
      <span class=\"text centered text-center\">#{rec[:alt]}</span>
    </a>
  </div>"
end

cms_key = "#{season}_orientation_html".to_sym
h = HomePageFeature.find_or_create_by(key: cms_key)
h.content = final_str
h.save
