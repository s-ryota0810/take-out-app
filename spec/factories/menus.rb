FactoryBot.define do
  factory :menu do
    name { Faker::Lorem.characters(number: 3) }
    price { Faker::Number.number(digits: 4) }
  end
end
