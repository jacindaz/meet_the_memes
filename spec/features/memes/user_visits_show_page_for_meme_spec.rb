require 'rails_helper'

feature 'User visits a show page for meme' do

  scenario 'User specific meme deets' do
    meme = FactoryGirl.create(:meme)
    #image = (File.join(Rails.root, '/spec/fixtures/images/captain_dogerica.jpg'))

    visit meme_path(meme)

    expect(page).to have_content(meme.name)
    expect(page).to have_xpath("//img[contains(@src, 'default.jpg' )]")
    expect(page).to have_content(meme.average_rating)
  end

end
