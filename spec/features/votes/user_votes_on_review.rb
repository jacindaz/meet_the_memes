require 'rails_helper'

feature 'User votes on a particular review' do

  scenario 'user votes up on review' do
    vote = FactoryGirl.create(:vote)

    visit meme_path(vote.review.meme)

    click_button "Vote Up"
    expect(page).to have_content("Your vote very thankful.")
    expect(vote.value).to eq(1)
  end

  scenario 'user votes down on review' do
    vote = FactoryGirl.create(:vote)

    visit meme_path(vote.review.meme)

    click_button "Vote Down"
    expect(page).to have_content("Much fail, your vote saved not.")
    expect(vote.value).to eq(-1)
  end

end
