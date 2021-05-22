FactoryBot.define do
  factory :shop do
    name { Faker::Lorem.characters(number: 3) }
  end
end