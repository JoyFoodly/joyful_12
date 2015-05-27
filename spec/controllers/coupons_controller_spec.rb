require 'spec_helper'

describe CouponsController do
  describe 'GET "show"' do
    describe 'response' do
      context 'missing a coupon' do
        before { xhr :get, :show, partner_id: 'does not exist' }

        it 'should return nothing' do
          expect(response.body).to eq({ shareable: nil,
                                        welcome_message: nil,
                                        price: nil,
                                        gift_price: nil }.to_json)
        end
      end

      context 'found coupon' do
        before do
          @coupon = create(:coupon)
          xhr :get, :show, partner_id: @coupon.shareable_tag
        end

        it 'should return shareable_tag, price, gift price and welcome message' do
          expect(response.body).to eq({ shareable: @coupon.shareable_tag,
                                        welcome_message: @coupon.welcome_message,
                                        price: @coupon.price,
                                        gift_price: @coupon.gift_price }.to_json)
        end
      end
    end
  end
end
