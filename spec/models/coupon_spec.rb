require 'spec_helper'

describe Coupon do
  subject(:coupon) { build(:coupon) }

  describe 'factory' do
    it { should be_valid }
  end

  describe '#expired?' do
    it 'nil should be not be expired' do
      coupon.expires_on = nil
      expect(coupon.expired?).to be_false
    end

    it 'future date should be not be expired' do
      coupon.expires_on = 1.day.from_now.utc
      expect(coupon.expired?).to be_false
    end

    it 'past date should be expired ' do
      coupon.expires_on = 1.day.ago.utc
      expect(coupon.expired?).to be_true
    end
  end

  describe '#gift?' do
    it 'does not return true when it is not prefixed with gift' do
      coupon.shareable_tag = 'black_friday_sale'
      expect(coupon.gift?).to be_false
    end

    it 'does not return true when gift is not prefixed' do
      coupon.shareable_tag = 'not_a_gift_really'
      expect(coupon.gift?).to be_false
    end

    it 'returns true when prefixed with gift' do
      coupon.shareable_tag = 'gift_for_you' 
      expect(coupon.gift?).to be_true
    end
  end
end
