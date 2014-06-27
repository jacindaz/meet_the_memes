require 'rails_helper'

feature 'User votes on a particular review' do
  context 'as an authenticated user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as(user)
    end

    scenario 'user votes up on review' do
      review = FactoryGirl.create(:review)
      visit meme_path(review.meme)
      click_on "Vote Up"

      expect(page).to have_content("Your vote very thankful.")
      expect(Vote.count).to eq(1)
      vote = Vote.first
      expect(vote.value).to eq(1)
      review.reload
      expect(review.popularity).to eq(1)
    end

    scenario 'user votes down on review' do
      review = FactoryGirl.create(:review)
      visit meme_path(review.meme)
      click_on "Vote Down"

      expect(page).to have_content("Your vote very thankful.")
      expect(Vote.count).to eq(1)
      vote = Vote.first
      expect(vote.value).to eq(-1)
      review.reload
      expect(review.popularity).to eq(-1)
    end

    scenario 'user changes vote' do

      vote = FactoryGirl.create(:vote, user: user)
      visit meme_path(vote.review.meme)
      click_on "Vote Down"

      vote = Vote.first
      expect(vote.value).to eq(-1)
      expect(vote.review.popularity).to eq(-1)
      expect(page).to have_content "Change vote such update."
    end
  end

end
