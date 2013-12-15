require 'spec_helper'

feature 'Edit user' do
  let(:user) { FactoryGirl.create(:user) }
  before(:each) { sign_in(user) }

  scenario 'allows a user to edit their profile after signing in' do
    fill_in 'user_first_name', with: 'EditedFirstName'
    click_button 'Update Account'
    expect(page).to have_text('Account updated!')
    expect(user.reload.first_name).to eq('EditedFirstName')
  end

  scenario 'shows an error if validations fail' do
    fill_in 'user_first_name', with: ''
    click_button 'Update Account'
    expect(page).to have_text("First name can't be blank")
    expect(page).to_not have_text('Account updated!')
  end
end
