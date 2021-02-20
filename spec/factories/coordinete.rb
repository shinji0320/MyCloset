FactoryBot.define do
  factory :coordinete do
    name { Faker::Lorem.characters(number:10) }
  end
end