FactoryGirl.define do
  factory :review do
    rating 5
    sequence(:title) {|n| "Review Title #{n}"}
    body "This made me lol so hard!"
    popularity 0
    meme
    user
  end
end
