require 'spec_helper'

feature 'Admin sign in' do
  scenario 'allows admin users to sign in' do
    admin = Admin.create!(email: 'email@example.com', password: 'secretpass')
    visit rails_admin_path
    fill_in 'admin_email', with: admin.email
    fill_in 'admin_password', with: 'secretpass'
    click_button 'Sign In'
    expect(page).to have_content('Site Administration')
  end
end
