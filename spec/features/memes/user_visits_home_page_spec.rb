require 'rails_helper'

feature 'User sees a list of memes on the home page.' do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'User sees a list of memes.' do
    memes = FactoryGirl.create_list(:meme, 3)

    sign_in_as(user)
    visit memes_path

    memes.each do |meme|
      expect(page).to have_content(meme.name)
    end

  end

end
