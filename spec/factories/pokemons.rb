FactoryBot.define do
  factory :pokemon do
    name {Faker::Name.name}
    height {Faker::Number.number(digits: 2)}
    weight {Faker::Number.number(digits: 2)}
    base_experience {Faker::Number.number(digits: 2)}
    order {Faker::Number.number(digits: 2)}
  end
end
