require 'spec_helper'


describe ApplicationController do
  controller do
    def index
      set_price
      render inline: 'dummy'
    end
  end

  before do
    @test_price = 40
    ENV['PRICE_PER_SEASON'] = @test_price.to_s
    get :index
  end

  describe 'set_price' do
    context 'without a coupon' do
      it 'sets the correct variables' do
        expect(assigns(:price)).to eq @test_price
        expect(assigns(:gift_price)).to eq @test_price
        expect(assigns(:welcome_message)).to be_blank
      end
    end

    context 'with coupon' do
      before do
        @coupon = create(:coupon)
        get :index, nil, { partner_id: @coupon.shareable_tag }
      end

      it 'sets the correct variables' do
        expect(assigns(:price)).not_to eq @test_price
        expect(assigns(:gift_price)).not_to eq @test_price
        expect(assigns(:welcome_message)).not_to be_blank
        expect(assigns(:price)).to eq @coupon.price
        expect(assigns(:gift_price)).to eq @coupon.gift_price
        expect(assigns(:welcome_message)).to eq @coupon.welcome_message
      end
    end
  end
end
