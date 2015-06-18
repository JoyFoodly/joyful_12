class GiftMailer < ActionMailer::Base
  default from: 'hollie@joyfoodly.com'

  def sign_up(gift)
    @gift = gift
    @coupon = gift.coupon
    mail(to: @gift.their_email, subject: "#{@gift.your_name} sent you Joyful12!")
  end
end
