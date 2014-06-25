require 'rails_helper'

feature 'User signs up successfully, doge memes aplenty.' do
  scenario 'User enters a valid username and password.' do
    visit new_user_registration_path

    fill_in 'Email', with: 'bob@bigbob.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    fill_in 'Username', with: 'dogemaster1'

    click_on 'Sign up' 

    expect(page).to have_content('Wow. Such user.  Much sign up.')

  end
end
