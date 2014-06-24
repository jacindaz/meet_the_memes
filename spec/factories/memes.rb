# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meme do
    url "MyString"
    sequence(:name) {|n| "Meowsinkprrrrr #{n}"}
    description "MyText"
    average_rating 1.5
  end
end
