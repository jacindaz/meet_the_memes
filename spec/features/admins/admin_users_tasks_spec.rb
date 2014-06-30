require 'rails_helper'

feature 'Authorized admin can perform appropriate tasks' do
  let(:user1) { FactoryGirl.create(:user, admin: true) }
  before :each do
    sign_in_as(user1)
  end

  scenario 'Authorized admin promotes a user' do
    user2 = FactoryGirl.create(:user)
    visit admin_users_path
    click_link 'Promote User'

    expect(page).to have_content('Such promotion!')
    expect(page).to_not have_content('Promote User')
  end

  scenario 'Authorized admin promotes a user' do
    user2 = FactoryGirl.create(:user)
    visit admin_users_path
    first(:link, 'Delete User').click

    expect(page).to have_content('Wow. Much destroy.')
    expect(page).to have_content(user1.username)
    expect(User.count).to eq(1)
  end
end
