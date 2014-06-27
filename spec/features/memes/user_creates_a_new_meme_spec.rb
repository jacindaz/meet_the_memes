require 'rails_helper'

feature 'User creates a new meme' do

  scenario 'User creates a valid meme' do
    meme = FactoryGirl.build(:meme)

    visit new_meme_path

    fill_in 'Name', with: meme.name
    fill_in 'Url', with: meme.url
    fill_in 'Description', with: meme.description

    attach_file('Picture', File.join(Rails.root, '/spec/fixtures/images/captain_dogerica.jpg'))

    click_on 'Create Meme'

    expect(page).to have_content('Creates teh meme!!!')
    expect(page).to have_content(meme.name)
    expect(page).to have_content(meme.description)
  end

  scenario 'User doesn\'t fill in form! ooo no\'s' do
    visit new_meme_path
    click_on 'Create Meme'

    expect(page).to have_content('Whoopsie Goldberg. Such trouble.')
  end
end