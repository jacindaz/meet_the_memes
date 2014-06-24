require 'rails_helper'

feature 'User creates a new review for a specific meme' do

  scenario 'User creates a new review' do
    memes = FactoryGirl.create_list(:meme, 3)

    memes.each do |meme|
      reviews = FactoryGirl.create_list(:review, 3)
      visit meme_path(meme)

      reviews.each do |review|
        fill_in 'Rating', with: review.rating
        fill_in 'Title', with: review.title
        fill_in 'Body', with: review.body
        click_on 'Submit Review'

        expect(page).to have_content 'Success'
        expect(page).to have_content review.rating
        expect(page).to have_content review.title
        expect(page).to have_content review.body
      end
    end
  end

  scenario 'User adds a duplicate review' do
  end

  scenario 'User adds a blank review' do
  end

  scenario 'User leaves blank fields in review' do
  end

end
