FactoryGirl.define do

  factory :meme do
    url "http://noodlytime.com/img/a0126590_22302718.jpg"
    sequence(:name) {|n| "Meowsinkprrrrr #{n}"}
    description "Some kewl cats."
    user
  end

  factory :meme_with_reviews do
    after(:create) do |meme|
      create_list(:review, 3, meme: meme)
    end
  end

end
