FactoryBot.define do
  factory :booking do
    check_in_date { Faker::Date.forward(days: 10) }
    check_out_date { Faker::Date.forward(days: 15) } 
    number_of_rooms { Faker::Number.between(from: 1, to: 5) }
    association :user 
    association :room 
  end
end