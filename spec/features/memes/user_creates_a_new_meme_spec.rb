require 'rails_helper'

feature 'User creates a new meme' do
  context 'as an authenticated user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as(user)
    end

    scenario 'User creates a valid meme' do
      meme = FactoryGirl.create(:meme)
      visit new_meme_path

      fill_in 'meme_name', with: meme.name
      fill_in 'meme_url', with: meme.url
      fill_in 'meme_description', with: meme.description
      attach_file('meme_picture', File.join(Rails.root, '/spec/fixtures/images/captain_dogerica.jpg'))
      click_on 'Submit teh Meme'

      expect(page).to have_content("Creates teh meme!!!")
      expect(page).to have_content(meme.name)
      expect(page).to have_content(meme.description)
      expect(page).to have_content('No has rating!')
      expect(page).to have_xpath("//img[contains(@src, 'captain_dogerica.jpg' )]")
    end

    scenario 'User doesn\'t fill in form! ooo no\'s' do
      visit new_meme_path
      click_on 'Submit teh Meme'
      expect(page).to have_content("Whoopsie Goldberg. Such trouble.")
    end
  end
end
