require 'spec_helper'

feature 'Allows users to send Joyful 12 as a gift' do
  include CapybaraHelpers
  
  let(:my_gift) { build(:gift) }

  scenario 'without a coupon', js: true do
    visit_gift_page
    fill_in_gift_form(my_gift)
    fill_in_billing_info
    initial_count = Gift.count
    click_button 'Gift Joyful 12!'
    
    page.find('.rootpage').value

    expect(ActionMailer::Base.deliveries.last.to[0]).to eq 'jane.doe@gmail.com' # Their email
    expect(Gift.count).to eq initial_count + 1

    created_gift = Gift.last
    expect(created_gift.their_email).to eq my_gift.their_email
    expect(current_path).to eq root_path

    payment = Payment.last
    expect(current_path).to eq root_path
    expect(payment.amount).to eq ENV['PRICE_PER_SEASON'].to_i
  end

  scenario 'with a coupon', js: true do
    coupon = create(:coupon)

    visit_gift_page
    fill_in_gift_form(my_gift)
    set_coupon(coupon)
    fill_in_billing_info
    expect(page).to have_text("Total Amount To Be Charged: $25.00")

    initial_count = Gift.count
    click_button 'Gift Joyful 12!'
    page.find('.rootpage').value

    expect(Gift.count).to eq initial_count + 1

    created_gift = Gift.last
    expect(created_gift.their_email).to eq my_gift.their_email
    expect(current_path).to eq root_path

    payment = Payment.last
    expect(current_path).to eq root_path
    expect(Payment.last.amount).to eq coupon.price
  end

  scenario 'with a free coupon', js: true do
    coupon = create(:free_coupon)

    visit_gift_page
    fill_in_gift_form(my_gift)
    set_coupon(coupon)
    page.find('.alert-success').value

    initial_count = Gift.count
    payment_count = Payment.count

    expect(page).to have_text("Total Amount To Be Charged: $0.00")
    click_button 'Gift Joyful 12!'

    page.find('.rootpage').value

    expect(Gift.count).to eq initial_count + 1

    created_gift = Gift.last
    expect(created_gift.their_email).to eq my_gift.their_email
    expect(current_path).to eq root_path
    expect(Payment.count).to eq initial_count
  end
end
