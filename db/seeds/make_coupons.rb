shareable_tags = ['NovatoCoupon', 'HealthyKitchens']

coupon_info = {'NovatoCoupon' => {description: '20% off', welcome_message: 'Lu Sutton Parent!', price: 3840},
               'HealthyKitchens' => {description: '50% off', welcome_message: '2014 Attendee!', price: 2400}
              }
shareable_tags.each do |st|
  h=Coupon.find_or_create_by shareable_tag: st

  if coupon_info[st]
    h.description = coupon_info[st][:description]
    h.welcome_message = coupon_info[st][:welcome_message]
    h.price = coupon_info[st][:price]
    h.save
  end
end
