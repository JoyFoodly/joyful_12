require 'spec_helper'

describe Gift do
  subject(:gift) { build(:gift) }

  describe 'factory' do
    it { should be_valid }
  end

  describe 'validation' do
    [:coupon, :your_name, :your_email, :their_email, :price].each do |attr|
      it "should not be valid without #{attr}" do
        gift.send("#{attr}=".to_sym, nil)
        expect(gift).not_to be_valid
      end
    end
  end

  describe 'initialization' do
    it 'should create a new coupon instance' do
      gift = Gift.new
      expect(gift.coupon).not_to be_nil
    end
  end
end
