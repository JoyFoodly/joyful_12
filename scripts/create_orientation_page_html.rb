foods = Food.where('slug like ?', 'winter-%')
recipe_info = foods.each do |food|
  {slug: food.slug, alt: "Winter #{food.name}", url_loc: food.images[0].file.url}
end

recipe_info.each do |rec|
  puts "<div class=\"col-lg-3 col-md-6 col-xs-12 bottom-padding\">
    <a href=\"/classroom/#{rec[:slug]}\" class=\"image-text-link\">
      <img class='wiggle centered' alt=\"#{rec[:alt]}\" src=\"#{rec[:url_loc]}\"/>
      <span class=\"text centered text-center\">#{rec[:alt]}</span>
    </a>
  </div>"
end
