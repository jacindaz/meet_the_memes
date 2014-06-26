require 'rails_helper'

describe Review do

  it { should have_valid(:title).when("this is valid", "another title") }
  it { should have_valid(:rating).when(1, 5) }
  it { should have_valid(:body).when("this is an example body", "this is another example body") }

  it { should validate_uniqueness_of(:title) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:meme_id) }

end
