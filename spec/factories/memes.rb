# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meme do
    url "http://www.google.com"
    sequence(:name) {|n| "Meowsinkprrrrr #{n}"}
    description "Some kewl cats."
    average_rating 3
  end
end
