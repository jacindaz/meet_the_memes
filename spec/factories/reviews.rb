FactoryGirl.define do
  factory :review do
    rating 5
    title "LOL"
    body "This made me lol so hard!"
    meme
    user
  end
end
