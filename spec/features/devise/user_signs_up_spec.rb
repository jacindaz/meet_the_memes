require 'rails_helper'

feature 'User signs up successfully, doge memes aplenty.' do
  scenario 'User enters a valid username and password.' do
    visit new_user_registration_path

    fill_in 'Email', with: 'bob@bigbob.com'
    fill_in 'Password', with: '1234567890'
    fill_in 'Password confirmation', with: '1234567890'
    fill_in 'Username', with: 'dogemaster1'
    click_on 'Done'

    expect(User.count).to eq(1)
    user = User.where(email: 'bob@bigbob.com').first
    expect(user.username).to eq('dogemaster1')
    expect(page).to have_content('Wow. Such user.  Much sign up.')
  end

  scenario 'Username wrong length.' do
    visit new_user_registration_path

    fill_in 'Email', with: 'bob@bigbob.com'
    fill_in 'Password', with: '1234567890'
    fill_in 'Password confirmation', with: '1234567890'
    fill_in 'Username', with: 'd'
    click_on 'Done'

    expect(User.count).to eq(0)
    expect(page).to_not have_content('Wow. Such user.  Much sign up.')
    expect(page).to have_content('too short')
  end

end
