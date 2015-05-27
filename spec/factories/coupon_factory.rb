FactoryGirl.define do
  factory :coupon do
    description 'Coupon Factory'
    shareable_tag 'coupon_factory'
    welcome_message 'Welcome to testing.'
    price 25
    gift_price 2

    factory :free_coupon do
      price 0
    end
  end
end
