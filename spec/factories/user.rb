FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    username Faker::StarWars.character
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
  end
end
