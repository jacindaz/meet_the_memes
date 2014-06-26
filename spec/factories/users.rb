# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "bob#{n}@bigbob.com"}
    password '1234567890'
    password_confirmation '1234567890'
    sequence(:username) {|n| "dogemaster#{n}"}
  end
end
