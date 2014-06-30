require 'rails_helper'

feature 'Authorized admin can visit admin paths' do

  scenario 'Authorized admin visits index' do
    user = FactoryGirl.create(:user, admin: true)
    sign_in_as(user)
    visit admin_memes_path

    expect(page).to have_content('Admin')
    expect(page).to have_content('Behold Meme')
  end

  scenario 'Unauthorized user is denied from admin path' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit admin_memes_path

    expect(page).to have_content('No has authorization.')
    expect(page).to have_content('Behold Meme')
  end
end
