require 'rails_helper'

feature 'User visits a show page for meme' do
  let(:user) { FactoryGirl.create(:user) }


  scenario 'User specific meme deets' do
    meme = FactoryGirl.create(:meme)

    sign_in_as(user)
    visit meme_path(meme)

    expect(page).to have_content(meme.name)
    expect(page).to have_xpath("//img[contains(@src, 'default.jpg' )]")
    expect(page).to have_content(meme.average_rating)
  end

end
