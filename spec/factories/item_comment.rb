FactoryBot.define do
  factory :item_comment do
    comment { Faker::Lorem.characters(number:10) }
  end
end