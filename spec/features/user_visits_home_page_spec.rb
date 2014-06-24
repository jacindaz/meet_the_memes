require 'rails_helper'

feature 'User sees a list of memes on the home page.' do 
  scenario 'User sees a list of memes.' do
    memes = FactoryGirl.create_list(:meme, 3)

    visit memes_path

    memes.each do |meme|
      expect(page).to have_content(meme.name) 
    end
    
  end
  
end
