require 'rails_helper'

feature 'User searches memes.' do

  scenario 'Successfully searches.' do
    memes = FactoryGirl.create_list(:meme, 10)

    visit memes_path
    fill_in 'search', with: '4'
    click_button 'Search'

    expect(page).to have_content('Meowsinkprrrrr 4')
    expect(page).to_not have_content('Meowsinkprrrrr 1')
  end
end
