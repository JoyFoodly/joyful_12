shareable_tags = ['lusutton', 'HealthyKitchens']

coupon_info = {'lusutton' => {description: '20% off', welcome_message: 'Lu Sutton Parent!', price: 0, gift_price: 3840},
               'HealthyKitchens' => {description: '20% off', welcome_message: '2014 Attendee!', price: 3840}
              }
shareable_tags.each do |st|
  h=Coupon.find_or_create_by shareable_tag: st.downcase

  if coupon_info[st]
    h.description = coupon_info[st][:description]
    h.welcome_message = coupon_info[st][:welcome_message]
    h.price = coupon_info[st][:price]
    h.gift_price = coupon_info[st][:gift_price]
    h.save
  end
end
