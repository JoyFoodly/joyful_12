require 'capybara/rspec'

module CapybaraHelpers
  def visit_account_page
    visit root_path
    click_link 'START COOKING NOW!'
  end

  def visit_gift_page
    visit root_path
    click_link 'Or give the gift of Joyful 12'
  end

  def fill_in_account_form(user)
    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    fill_in 'user_password_confirmation', with: user.password
  end

  def fill_in_gift_form(gift)
    fill_in 'gift_your_name', with: gift.your_name
    fill_in 'gift_your_email', with: gift.your_email
    fill_in 'gift_their_email', with: gift.their_email
  end

  def fill_in_billing_info
    find("input[data-stripe='number']").set('5555555555554444')
    find("input[data-stripe='cvc']").set('123')
    find("select[data-stripe='exp-month']").find("option[value='12']").select_option 
    find("select[data-stripe='exp-year']").find("option[value='2020']").select_option 
  end

  def set_coupon(coupon)
    find('#coupon_value').set(coupon.shareable_tag)
    click_button('Apply')
  end
end
