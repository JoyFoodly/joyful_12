require 'spec_helper'

feature 'Allows users to purchase Joyful12' do
  include CapybaraHelpers

  let(:user) { build(:unpaid_user) }

  scenario 'without a coupon', js: true do
    visit_account_page
    fill_in_account_form(user)

    expect { click_button 'Add Billing Information' }.to change { User.count }.by(1)
    user = User.last
    expect(current_path).to eq new_payment_path
    expect(user.signed_up).to be_false

    fill_in_billing_info
    initial_count = Payment.count
    find('#create-account').click

    page.find('#navbar-right').value
    expect(current_path).to eq edit_user_path(user)

    user = User.last
    expect(user.signed_up).to be_true

    expect(Payment.last.amount).to eq ENV['PRICE_PER_SEASON'].to_i
    expect(Payment.count).to eq initial_count + 1
  end

  scenario 'with a coupon', js: true do
    coupon = create(:coupon)

    visit_account_page
    fill_in_account_form(user)
    set_coupon(coupon)

    expect(page).to have_text("Membership costs: $25.00")
    expect { click_button 'Add Billing Information' }.to change { User.count }.by(1)
    user = User.last
    expect(current_path).to eq new_payment_path
    expect(user.signed_up).to be_false

    fill_in_billing_info
    initial_count = Payment.count

    find('#create-account').click
    page.find('#navbar-right').value

    expect(current_path).to eq edit_user_path(user)
    expect(Payment.count).to eq initial_count + 1

    user = User.last
    expect(user.signed_up).to be_true
    expect(Payment.last.amount).to eq coupon.price
  end

  scenario 'with a free coupon', js: true do
    coupon = create(:free_coupon)

    visit_account_page
    fill_in_account_form(user)
    set_coupon(coupon)

    expect(page).to have_text("Membership costs: $0.00")
    expect { click_button 'Create Account' }.to change { User.count }.by(1)
    user = User.last
    expect(user.signed_up).to be_true
    expect(current_path).to eq edit_user_path(user)
  end

  scenario 'with a gift coupon', js: true do
    coupon = create(:gift_coupon)

    visit_account_page
    fill_in_account_form(user)
    set_coupon(coupon)

    expect { click_button 'Create Account' }.to change { User.count }.by(1)

    visit '/users/sign_out'
    visit '/clear'
    coupon.reload
    expect(coupon).to be_deleted

    visit_account_page
    fill_in_account_form(user)
    set_coupon(coupon)

    expect(page).to have_text 'not found'
  end
end
