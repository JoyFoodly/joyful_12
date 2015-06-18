require 'spec_helper'

describe Coupon do
  subject(:coupon) { build(:coupon) }

  describe 'factory' do
    it { should be_valid }
  end

  describe '#gift?' do
    it 'does not return true when it is not prefixed with gift' do
      coupon.shareable_tag = 'black_friday_sale'
      expect(coupon.gift?).to be false
    end

    it 'does not return true when gift is not prefixed' do
      coupon.shareable_tag = 'not_a_gift_really'
      expect(coupon.gift?).to be false
    end

    it 'returns true when prefixed with gift' do
      coupon.shareable_tag = 'gift_for_you' 
      expect(coupon.gift?).to be true
    end
  end
end
