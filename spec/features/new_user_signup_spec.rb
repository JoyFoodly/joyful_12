require 'spec_helper'

feature 'New user sign up' do
  scenario 'allows users to sign up via stripe' do
    # Tested in controller spec
  end

  scenario 'allows users to sign in afterward' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'secretpass'
    click_button 'Sign in'

    expect(page).to have_text('Signed in successfully.')
  end
end
