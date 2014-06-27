# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meme do
    url "http://noodlytime.com/img/a0126590_22302718.jpg"
    sequence(:name) {|n| "Meowsinkprrrrr #{n}"}
    description "Some kewl cats."
    average_rating 3.5
  end
end
