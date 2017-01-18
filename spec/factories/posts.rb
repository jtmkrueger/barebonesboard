FactoryGirl.define do
  factory :post do
    title Faker::StarWars.droid
    body Faker::StarWars.quote
  end
end
