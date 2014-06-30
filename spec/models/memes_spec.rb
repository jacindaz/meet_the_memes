require 'rails_helper'

describe Meme do

  it 'updates average rating cache' do
    meme = FactoryGirl.create(:meme)
    FactoryGirl.create(:review, rating: 5, meme: meme)
    FactoryGirl.create(:review, rating: 1, meme: meme)

    expect(meme.average_rating).to eq(3.0)
  end

end
