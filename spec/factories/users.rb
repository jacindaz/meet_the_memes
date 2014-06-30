FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "bob#{n}@bigbob.com"}
    password '1234567890'
    password_confirmation '1234567890'
    sequence(:username) {|n| "dogemaster#{n}"}
    admin false
  end
end
