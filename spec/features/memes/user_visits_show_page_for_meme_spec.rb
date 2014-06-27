require 'rails_helper'

feature 'User visits a show page for meme' do

  scenario 'User specific meme deets' do
    meme = FactoryGirl.create(:meme)
    image = page.find('#picture')

    visit meme_path(meme)

    expect(page).to have_content(meme.name)
    expect(image['src']).to eq("#{default.jpg}")
    expect(page).to have_content(meme.average_rating)
  end

end
