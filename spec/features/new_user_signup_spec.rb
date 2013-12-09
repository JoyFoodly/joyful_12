require 'spec_helper'

feature 'New user sign up' do
  scenario 'displays the user\'s email after successful sign up' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'email@example.com'
    fill_in 'user_first_name', with: 'James'
    fill_in 'user_last_name', with: 'Deen'
    fill_in 'user_zip_code', with: '98125'
    fill_in 'user_password', with: 'secretpass'
    fill_in 'user_password_confirmation', with: 'secretpass'
    click_button 'Sign up'

    expect(page).to have_text('Welcome! You have signed up successfully.')
    expect(page).to have_selector('.user_email', text: 'email@example.com')
    expect(page).to have_selector('.user_first_name', text: 'James')
    expect(page).to have_selector('.user_last_name', text: 'Deen')
    expect(page).to have_selector('.user_zip_code', text: '98125')
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
