require 'spec_helper'
require 'stripe_mock'

feature 'Allows users to purchase Joyful12' do
  self.use_transactional_fixtures = false
  let(:user) { build(:unpaid_user) }

  scenario 'without a coupon', js: true do
    visit_account_page
    fill_in_account_form(user)

    expect { click_button 'Add Billing Information' }.to change { User.count }.by(1)
    user = User.last
    expect(current_path).to eq new_payment_path
    expect(user.signed_up).to be_false

    fill_in_billing_info

    expect { find('#create-account').click }.to change { Payment.count }.by(1)
    payment = Payment.last
    expect(user.signed_up).to be_true
    expect(current_path).to eq edit_user_path(user)
    expect(payment.amount).to eq ENV['PRICE_PER_SEASON'].to_i
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

    expect { find('#create-account').click }.to change { Payment.count }.by(1)
    payment = Payment.last
    expect(user.signed_up).to be_true
    expect(current_path).to eq edit_user_path(user)
    expect(payment.amount).to eq coupon.amount
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

  def visit_account_page
    visit root_path
    click_link 'START COOKING NOW!'
  end

  def fill_in_account_form(user)
    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    fill_in 'user_password_confirmation', with: user.password
  end

  def set_coupon(coupon)
    find('#coupon_value').set(coupon.shareable_tag)
    click_button('Apply')
  end

  def fill_in_billing_info
    find("input[data-stripe='number']").set('4242424242424242')
    find("input[data-stripe='cvc']").set('123')
    find("select[data-stripe='exp-year']").find("option[value='2020']").select_option 
  end
end
