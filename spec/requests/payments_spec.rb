require 'spec_helper'

describe 'Payments' do
  describe 'GET /payments/new' do
    before do
      user = FactoryGirl.create(:unpaid_user)
      login_as(user, :scope => :user)
      visit new_payment_path
    end

    context 'submit form to POST /payments' do
      it 'should not send cc, cvc, or cc exp info' do
        find('input[data-stripe="number"]').set('4242424242424242')
        find('input[data-stripe="cvc"]').set('123')
        find('select[data-stripe="exp-month"]').set('10')
        find('select[data-stripe="exp-year"]').set('2050')
        click_button('Subscribe to Joyful 12!')
        page.driver.request.params.should_not include('credit_card_number', 'cvc', 'expiration_month', 'expiration_year')
      end
    end
  end
end
