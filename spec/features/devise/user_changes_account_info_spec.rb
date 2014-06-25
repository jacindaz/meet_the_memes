require 'rails_helper'

feature 'User edits account info.' do
  scenario 'User enters valid email, username, new password and confirmation, and old password.' do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'Username', with: user.username
    click_on 'Done'

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Done' 

    visit edit_user_registration_path

    fill_in 'Email', with: 'craig@greig.com'
    fill_in 'Password', with: '10987654321'
    fill_in 'Password confirmation', with: '10987654321'
    fill_in 'Current password', with: user.password
    fill_in 'Username', with: 'coffeeplants5'
    click_on 'Update' 

    expect(page).to have_content('Wow. Such different. Much update.')
    updated_user = User.where(email: 'craig@greig.com').first
    expect(updated_user.username).to eq('coffeeplants5')
  end

end
