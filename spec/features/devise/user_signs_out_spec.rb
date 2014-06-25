require 'rails_helper'

feature 'User signs out.' do
  scenario 'User clicks on sign out' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Done' 

    expect(page).to have_content('Such welcome. Doge friends.')

    click_on 'Sign Out'

    expect(page).to have_content('Sign In')
    expect(page).to have_content('Most goodbyz.')
  end

end
