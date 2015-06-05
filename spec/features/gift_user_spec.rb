require 'spec_helper'

feature 'Allows users to send Joyful12 as a gift' do
  include CapybaraHelpers

  self.use_transactional_fixtures = false
  let(:gift) { build(:gift) }

  before do
    @client = StripeMock.start_client
  end

  after do
    StripeMock.stop_client
  end

  scenario 'without a coupon', js: true do
    visit_gift_page
    fill_in_gift_form(gift)
    fill_in_billing_info

    expect { find('#create-account').click }.to change { Gift.count }.by(1)
    created_gift = Gift.last 
    expect(created_gift.attributes).to eq gift
    expect(current_path).to eq root_path
    
    payment = Payment.last
    expect(current_path).to eq root_path
    expect(payment.amount).to eq ENV['PRICE_PER_SEASON'].to_i
  end
end
