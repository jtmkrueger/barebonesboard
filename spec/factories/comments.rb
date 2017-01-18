FactoryGirl.define do
  factory :comment do
    body Faker::StarWars.quote
  end
end
