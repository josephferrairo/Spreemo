FactoryGirl.define do
  factory :category do
    specialty  { Faker::StarWars.character}
    ailment    { Faker::StarWars.vehicle }
  end
end
