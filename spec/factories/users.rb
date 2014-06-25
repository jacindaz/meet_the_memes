# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'bob@bigbob.com'
    password '1234567890'
    password_confirmation '1234567890'
    username 'dogemaster1'
  end
end
