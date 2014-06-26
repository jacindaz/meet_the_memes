require 'rails_helper'

feature 'User votes on a particular review' do

  scenario 'user votes up on review' do
    vote = FactoryGirl.create(:vote)
  end

  scenario 'user votes down on review' do

  end

end
