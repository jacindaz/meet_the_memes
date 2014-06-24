FactoryGirl.define do
  factory :review do
    sequence(:meme_id) {|n| n }
    rating 5
    title "LOL"
    body "This made me lol so hard!"
  end
end     
