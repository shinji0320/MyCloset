FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 10) }
    shop_name { Faker::Lorem.characters(number: 20) }
    detail { Faker::Lorem.characters(number: 140) }
  end
end
