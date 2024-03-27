FactoryBot.define do
  factory :room do
    number { Faker::Number.unique.number(digits: 3) }
    association :hotel
  end
end