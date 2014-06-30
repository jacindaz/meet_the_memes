require 'rails_helper'

describe Review do

  it 'verifies review' do
    meme = FactoryGirl.create(:meme)
    review = FactoryGirl.create(:review, meme: meme)

    should validate_uniqueness_of(:title)
    should validate_uniqueness_of(:user_id).scoped_to(:meme_id)
    should have_valid(:title).when("this is valid", "another title")
    should have_valid(:rating).when(1, 5)
    should have_valid(:body).when("this is an example body", "this is another example body")
  end

  it 'updates review popularity when voting' do
    review = FactoryGirl.create(:review)
    expect(review.popularity).to eq(0)
    vote = FactoryGirl.create(:vote, value: 1, review_id: review.id)
    review.calculate_popularity
    expect(review.popularity).to eq(1)
  end

end
