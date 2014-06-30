require 'rails_helper'

feature 'Authorized admin can perform appropriate tasks' do
  let(:meme) { FactoryGirl.create(:meme) }
  before :each do
    user = FactoryGirl.create(:user, admin: true)
    sign_in_as(user)
  end

  scenario 'Authorized admin deletes a meme' do
    visit admin_meme_path(meme)
    expect(page).to have_content('Admin')
    expect(page).to have_content(meme.name)
    click_on 'Delete Meme'

    expect(page).to have_content('Wow. Much destroy.')
    expect(page).to_not have_content(meme.name)
  end

  scenario 'Authorized admin deletes a review' do
    review = FactoryGirl.create(:review, meme: meme)

    visit admin_meme_path(meme)
    expect(page).to have_content('Admin')
    expect(page).to have_content(meme.name)
    expect(page).to have_content(review.title)
    click_on 'Delete Review'

    expect(page).to have_content('Wow. Much destroy.')
    expect(page).to have_content(meme.name)
    expect(page).to_not have_content(review.title)
  end
end
