# coding: utf-8
keys = [[:rightcolumn_subtext, 'lusutton'], [:signup_modal_text, 'lusutton'],
        [:general_welcome_message, 'lusutton'], ]

contents = {
            [:signup_modal_text, 'lusutton'] => 'Welcome, Lu Sutton Families!',
            [:rightcolumn_subtext, 'lusutton'] => 'Free Access to Lu Sutton families!', 
            [:general_welcome_message, 'lusutton'] => 'Welcome Lu Sutton Families',
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
