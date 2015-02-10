# coding: utf-8
keys = [:box11_text, :box12_text, :box21_text, :box22_text, :box11_header, :box12_header, :box21_header, :box22_header, [:general_welcome_message, nil], [:general_welcome_message, 'HealthyKitchens'], [:welcome_bullets, nil], [:welcome_bullets, 'HealthyKitchens'], :section_title_one, :section_title_two, [:rightcolumn_subtext, nil], [:rightcolumn_subtext, 'HealthyKitchens'], :section_subtext_one, :section_subtext_two]

contents = {box11_header: 'Improve your family’s health', box11_text: 'You get lifetime access to 144 family friendly (gluten and allergy free) recipes, over 50 skill building videos, and a time saving shopping list to help you master 48 vegetables and fruits in a year',
            box12_header: 'Get your kids to love veggies', box12_text: 'Learn Chef Hollie’s proven methods, taught to thousands of kids and parents, to excite kids to try a variety of vegetables and fruits',
            box21_header: 'Build kitchen confidence', box21_text: 'Learn at your own pace with our online program through easy, medium, and adventurous recipes for every veggie and fruit and over 50 skill-building videos to make cooking veggies quick and delicious',
            box22_header: 'Support our Joyful 12 school projects', box22_text: 'Your purchase helps us provide cooking education to every parent, teacher, and child of partner schools through a lifetime access to the Joyful 12',
            [:general_welcome_message, nil] => 'COOK VEGGIES YOUR KIDS WILL LOVE.',
            [:general_welcome_message, 'HealthyKitchens'] => 'Join me Healthy Kitchens, Healthy Lives Participants',
            [:general_welcome_message, 'lusutton'] => 'Welcome Lu Sutton Families',
            [:signup_modal_text, 'lusutton'] => 'Welcome Lu Sutton Families',
            welcome_bullets_old: '<li>Master 48 fruits and veggies</li><li>144 family-friendly recipes for all the year</li><li>Master 48 fruits and veggies</li><li>144 family-friendly recipes for all the year</li>',
            [:welcome_bullets, nil] => '<p>My Joyful 12 Online Learning Lab can help you improve your family\'s health one delicious vegetable at a time.</p><p>From spring peas to winter squash, you will learn how to buy, cook, and engage your kids to love eating a wide variety of seasonal produce with joy!</p>',
            section_title_one: 'Holy Sweet Potato... Easy <em>And</em> Delicious!',
            section_title_two: 'Give the gift of the Joyful 12!',
            section_subtext_one: 'The Joyful12 is an online kitchen learning lab that helps parents learn how to joyfully get fruits and veggies into their families\' diets.',
            section_subtext_two: 'Show your love with a year of learning how to cook and eat 48 seasonal vegetables and fruits. Feel great knowing that every purchase provides lifetime access to a family in our Joyful 12 school projects.',
            [:rightcolumn_subtext, nil] => 'Get lifetime access to the Joyful 12 for $48',
            [:rightcolumn_subtext, 'HealthyKitchens'] => 'Take advantage of your special 20% discount (reg. $48)',
            [:rightcolumn_subtext, 'lusutton'] => 'Free Access to Lu Sutton families!', 

           }

keys.each do |k|
  if k.is_a? Symbol or (k.is_a? Array and k[1].nil?)
    h=HomePageFeature.find_or_create_by key: (k.is_a?(Symbol) ? k : k[0])
  else
    c=Coupon.find_by_shareable_tag k[1].downcase
    h=HomePageFeature.find_or_create_by(key: k[0], coupon: c)
  end
  if !h.content && contents[k]
    h.content = contents[k] 
    h.save
  end
end
