# coding: utf-8
keys = [:box11_text, :box12_text, :box21_text, :box22_text, :box11_header, :box12_header, :box21_header, :box22_header, [:general_welcome_message, nil], [:general_welcome_message, 'HealthyKitchens'], [:welcome_bullets, nil], [:welcome_bullets, 'HealthyKitchens'], :section_title_one, :section_title_two, :rightcolumn_subtext, :section_subtext_one, :section_subtext_two]

contents = {box11_header: 'Improve your family’s health', box11_text: 'You get lifetime access to 144 family friendly (gluten and allergy free) recipes, over 50 skill building videos, and a time saving shopping list to help you master 48 vegetables and fruits in a year',
            box12_header: 'Get your kids to love veggies', box12_text: 'Learn Chef Hollie’s proven methods, taught to thousands of kids and parents, to excite kids to try a variety of vegetables and fruits',
            box21_header: 'Build kitchen confidence', box21_text: 'Learn at your own pace with our online program through easy, medium, and adventurous recipes for every veggie and fruit and over 50 skill-building videos to make cooking veggies quick and delicious',
            box22_header: 'Support our Joyful 12 school projects', box22_text: 'Your purchase helps us provide cooking education to every parent, teacher, and child of partner schools through a lifetime access to the Joyful 12',
            [:general_welcome_message, nil] => 'COOK VEGGIES YOUR KIDS WILL LOVE.',
            [:general_welcome_message, 'HealthyKitchens'] => 'Join me Healthy Kitchens, Healthy Lives Participants',
            welcome_bullets_old: '<li>Master 48 fruits and veggies</li><li>144 family-friendly recipes for all the year</li><li>Master 48 fruits and veggies</li><li>144 family-friendly recipes for all the year</li>',
            [:welcome_bullets, nil] => '<p>Kids demand smashed cauliflower when their parents cook the Joyful12! <p> Improve the health of your children with our joyful method to cook a wide variety of fruits and vegetables every season.<P>Every purchase supports our Joyful 12 School Projects.',
            [:welcome_bullets, 'HealthyKitchens'] => '<p>Start cooking veggies your kids will demand.</P><p>My Joyful 12 Online Learning Lab will help you improve the health of your children with over 100 family friendly recipes to love cooking and eating seasonal veggies every month of the year.</p>',
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
