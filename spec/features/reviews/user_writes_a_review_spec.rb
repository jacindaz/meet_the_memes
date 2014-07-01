require 'rails_helper'

feature 'User creates a new review for a specific meme' do
  scenario 'User creates a new review' do
    meme = FactoryGirl.create(:meme)
    user = FactoryGirl.create(:user)
    emails_sent = ActionMailer::Base.deliveries.count

    sign_in_as(user)

    visit meme_path(meme)

    select 5, from: 'Rating'
    fill_in 'Title', with: 'excellent meme'
    fill_in 'Body', with: 'good stuff very insightful meme here'

    click_button 'Submit Review'

    expect(page).to have_content('excellent meme')
    expect(page).to have_content('good stuff very insightful meme here')
    expect(page).to have_content('5')
    expect(ActionMailer::Base.deliveries.count).to eq(emails_sent + 1)

    expect(meme.reviews.count).to eq(1)
  end
end
