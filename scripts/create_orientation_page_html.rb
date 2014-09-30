recipe_info=
  [{slug: 'fall-apple', alt: 'Fall Apple', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/904cf1654826b1a93b08cd1d076c985d569307f6.png?1412019653'},
   {slug: 'fall-winter-squash', alt: 'Fall Winter Squash', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/1c54571bbaaea839d5b5e9eed2f9cbcc72b5e787.png?1412019851'},
   {slug: 'fall-mushrooms', alt: 'Fall Mushrooms', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/3023f8620567894c7638593563c3e50344623c51.png?1412019833'},
   {slug: 'fall-leeks', alt: 'Fall Leeks', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/91a2936fa2a0b31532246c45814c74290375d5f7.png?1412019813'},
   {slug: 'fall-jicama', alt: 'Fall Jicama', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/599bb56718669916c655bdc19665444ffdf82fcc.png?1412019804'},
   {slug: 'fall-greens', alt: 'Fall Greens', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/21f5b3cd5ed38351db93133dbc291dead5a24236.png?1412019788'},
   {slug: 'fall-figs', alt: 'Fall Figs', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/4160ca68fc7873c0c69baf05b336722d7d8299da.png?1412019776'},
   {slug: 'fall-cranberries', alt: 'Fall Cranberries', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/5719c4983dd759bd6e741c33a216ddfa46a0698f.png?1412019758'},
   {slug: 'fall-celeriac', alt: 'Fall Celeriac', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/766e1a67420fd7941507c1260d0032e5ee11a237.png?1412019734'},
   {slug: 'fall-carrots', alt: 'Fall Carrots', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/dbfb02419afddd905a184332d469a81de98958ee.png?1412019723'},
   {slug: 'fall-cauliflower', alt: 'Fall Cauliflower', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/98ce71e1ffb64822e7ba6f3ff2e4925598a54b4e.png?1412019712'},
   {slug: 'fall-broccoli', alt: 'Fall Broccoli', url_loc: 'http://d3uroln2zt6ogz.cloudfront.net/pages/media/original/8d0cba9a29b1b1838b069d61a780839db7b02c07.png?1412019691'}
  ]

recipe_info.each do |rec|
  puts "<div class=\"col-lg-3 col-md-6 col-xs-12 bottom-padding\">
    <a href=\"/classroom/#{rec[:slug]}\" class=\"image-text-link\">
      <img class='wiggle centered' alt=\"#{rec[:alt]}\" src=\"#{rec[:url_loc]}\"/>
      <span class=\"text centered text-center\">#{rec[:alt]}</span>
    </a>
  </div>"
end
