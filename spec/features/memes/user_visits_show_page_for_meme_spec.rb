require 'rails_helper'

feature 'User visits a show page for meme' do

  scenario 'User specific meme deets' do
    meme = FactoryGirl.create(:meme, average_rating: 3.0)

    visit meme_path(meme)

    expect(page).to have_content(meme.name)
    expect(page).to have_css("img[src=\"#{meme.url}\"]")
    expect(page).to have_content(meme.average_rating)
  end

end
