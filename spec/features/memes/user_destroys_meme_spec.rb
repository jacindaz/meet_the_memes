require 'rails_helper'

feature 'User deletes a meme' do 

  scenario 'User deletes a meme' do
    meme = FactoryGirl.create(:meme)

    visit meme_path(meme)

    click_on 'Delete'

    expect(page).to have_content("Wow. Much destroy.")
    expect(page).to_not have_content(meme.name)
  end

end
