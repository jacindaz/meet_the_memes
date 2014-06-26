require 'rails_helper'

feature 'User creates a new review for a specific meme' do
  scenario 'User creates a new review' do
    meme = FactoryGirl.create(:meme)
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    visit meme_path(meme)

    fill_in 'Rating', with: 5
    fill_in 'Title', with: 'excellent meme'
    fill_in 'Body', with: 'good stuff'

    click_button 'Submit Review'

    expect(page).to have_content('excellent meme')
    expect(page).to have_content('good stuff')
    expect(page).to have_content('5')

    expect(meme.reviews.count).to eq(1)
  end
end
