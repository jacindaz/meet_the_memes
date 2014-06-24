require 'rails_helper'

describe Review do

  it { should have_valid(:title) }
  it { should have_valid(:rating) }
  it { should have_valid(:body) }

  it { should validate_uniqueness_of(:title) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:meme) }

end
