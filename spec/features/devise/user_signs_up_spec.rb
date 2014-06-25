require 'rails_helper'

feature 'User signs up successfully, doge memes aplenty.' do
  scenario 'User enters a valid username and password.' do
    visit new_user_registration_path

    fill_in 'Email', with: 'bob@bigbob.com'
    fill_in 'Password', with: '1234567890'
    fill_in 'Password confirmation', with: '1234567890'
    fill_in 'Username', with: 'dogemaster1'
    click_on 'Sign up' 

    expect(page).to have_content('Wow. Such user.  Much sign up.')
  end

  scenario 'User doesn\'t fill out required fields.' do
    visit new_user_registration_path

    click_on 'Sign up' 

    expect(page).to_not have_content('Wow. Such user.  Much sign up.')
    expect(page).to have_content('can\'t be blank')
  end

  scenario 'Passwords don\'t match.' do
    visit new_user_registration_path

    fill_in 'Email', with: 'bob@bigbob.com'
    fill_in 'Password', with: '1234567890'
    fill_in 'Password confirmation', with: '101112131415'
    fill_in 'Username', with: 'dogemaster1'
    click_on 'Sign up' 

    expect(page).to_not have_content('Wow. Such user.  Much sign up.')
    expect(page).to have_content('doesn\'t match')
  end

  scenario 'Password too short.' do
    visit new_user_registration_path

    fill_in 'Email', with: 'bob@bigbob.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    fill_in 'Username', with: 'dogemaster1'
    click_on 'Sign up' 

    expect(page).to_not have_content('Wow. Such user.  Much sign up.')
    expect(page).to have_content('too short')
  end

  scenario 'Username wrong length.' do
    visit new_user_registration_path

    fill_in 'Email', with: 'bob@bigbob.com'
    fill_in 'Password', with: '1234567890'
    fill_in 'Password confirmation', with: '1234567890'
    fill_in 'Username', with: 'd'
    click_on 'Sign up' 

    expect(page).to_not have_content('Wow. Such user.  Much sign up.')
    expect(page).to have_content('too short')
  end

end
