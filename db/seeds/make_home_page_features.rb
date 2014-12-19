keys = [:box11_text, :box12_text, :box21_text, :box22_text, :box11_header, :box12_header, :box21_header, :box22_header, [:general_welcome_message, nil], [:general_welcome_message, 'NovatoCoupon'], :welcome_bullets, :section_title_one, :section_title_two, :rightcolumn_subtext, :section_subtext_one, :section_subtext_two]

contents = {box11_header: 'Eat the Rainbox', box11_text: 'Feel great about the meals you make for your family. 12 veggies and fruits', box12_header: 'Time Saving Shopping List', box12_text: 'Make shopping easy with a shopping list. You can email',
            [:general_welcome_message, nil] => 'COOK VEGGIES YOUR KIDS WILL LOVE.',
            [:general_welcome_message, 'NovatoCoupon'] => 'Join me Healthy Kitchens, Healthy Lives Participants',
            welcome_bullets_old: '<li>Master 48 fruits and veggies</li><li>144 family-friendly recipes for all the year</li><li>Master 48 fruits and veggies</li><li>144 family-friendly recipes for all the year</li>',
            welcome_bullets: '<p>Kids demand smashed cauliflower when their parents cook the Joyful12! <p> Improve the health of your children with our joyful method to cook a wide variety of fruits and vegetables every season.<P>Every purchase supports our Joyful 12 School Projects.',
            rightcolumn_subtext: 'Get cooking lessons year round in your own home for ',
            section_title_one: 'HOLY SWEET POTATO! COOKING DELICIOUS VEGGIES HAS NEVER BEEN EASIER',
            section_title_two: 'Give the gift of the Joyful 12!',
            section_subtext_one: 'The Joyful12 is an online kitchen learning lab that helps parents learn how to joyfully get fruits and veggies into their families\' diets.',
            section_subtext_two: 'Show your love with a year of learning how to cook and eat 48 seasonal vegetables and fruits. Feel great knowing that every purchase provides lifetime access to a family in our Joyful 12 School Projects.',
            
           }

keys.each do |k|
  if k.is_a? Symbol or (k.is_a? Array and k[1].nil?)
    h=HomePageFeature.find_or_create_by key: (k.is_a?(Symbol) ? k : k[0])
  else
    c=Coupon.find_by_shareable_tag k[1]
    h=HomePageFeature.find_or_create_by(key: k[0], coupon: c)
  end
  h.content = contents[k] if contents[k]
  h.save
end
