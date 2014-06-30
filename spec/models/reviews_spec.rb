require 'rails_helper'

describe Review do

  it { should have_valid(:title).when("this is valid", "another title") }
  it { should have_valid(:rating).when(1, 5) }
  it { should have_valid(:body).when("this is an example body", "this is another example body") }

  it { should validate_uniqueness_of(:title) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:meme_id) }

  it 'updates review popularity when voting' do
    review = FactoryGirl.create(:review)
    expect(review.popularity).to eq(0)
    vote = FactoryGirl.create(:vote, value: 1, review_id: review.id)
    review.calculate_popularity
    expect(review.popularity).to eq(1)
  end

end
