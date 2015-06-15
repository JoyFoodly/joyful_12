FactoryGirl.define do
  factory :coupon do
    description 'Coupon Factory'
    shareable_tag 'coupon_factory'
    welcome_message 'Welcome to testing.'
    price 2500
    gift_price 2500

    factory :free_coupon do
      price 0
      gift_price 0

      factory :gift_coupon do
        shareable_tag 'gift_abcdefgh'
      end
    end
  end
end
