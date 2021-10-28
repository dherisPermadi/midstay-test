FactoryBot.define do
  factory :random_flat, class: Flat do
    name { Faker::Name.unique.name }
    address { Faker::Address.street_address }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
