require 'rails_helper'

feature 'User searches memes.' do

  scenario 'Successfully searches.' do
    memes = FactoryGirl.create_list(:meme, 10)
    meme = memes.pop

    visit memes_path
    fill_in 'search', with: meme.name
    click_button 'Search'

    expect(page).to have_content(meme.name)
    expect(page).to_not have_content(memes.sample.name)
  end
end
