FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(number: 20) }
    prefecture { '北海道' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
