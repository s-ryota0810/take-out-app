FactoryBot.define do
  factory :comment do
    title { Faker::Lorem.characters(number: 3) }
    content { Faker::Lorem.characters(number: 100) }
    star { Faker::Number.between(from:1, to: 5) }
  end
end
