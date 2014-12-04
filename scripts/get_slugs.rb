# coding: utf-8
a=[1, 61, 52, 55, 58, 195, 185, 188, 49, 202]
b=[2, 62, 53, 56, 59, 197, 186, 189, 50, 203]
c=[3, 63, 54, 57, 60, 198, 187, 191, 51, 204]
d=[4, 193, 199, 64, 192, 200, 65, 194, 201, 66]

a.zip(b,c,d).each do |quad|
  puts "<tr> #{quad}"
  recipes=quad.map do |id|
    r=Recipe.find_by_id id
    r
  end
    
  if recipes and recipes.compact.size > 0
    v1 = recipes[0].food
    v2 = recipes[3].food
    
    puts "<td><%= link_to image_tag('nav-food-images/#{v1.slug}.png', width: 80, class: 'wiggle'), food_path('#{v1.slug}') %></td>
      <th>#{v1.name} and #{v2.name}</th>
      <td><a href='https://www.joyful12.com/classroom/#{v1.slug}/##{recipes[0].slug}'>#{recipes[0].title}</a></td>
      <td><a href='https://www.joyful12.com/classroom/#{v1.slug}/##{recipes[1].slug}'>#{recipes[1].title}</a></td>
      <td><a href='https://www.joyful12.com/classroom/#{v1.slug}/##{recipes[2].slug}'>#{recipes[2].title}</a>
      <br />
      Dessert: <a href='https://www.joyful12.com/classroom/#{v2.slug}/##{recipes[3].slug}'>#{recipes[3].title}</a></td>"
  end
  puts "</tr>"
end

