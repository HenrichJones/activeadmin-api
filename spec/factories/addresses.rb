FactoryBot.define do
  factory :address do
    neigborhood { Faker::Address.street_address }
    zipcode     { Faker::Address.zip_code }
    street      { Faker::Address.street_name }
    state       { Faker::Address.state }
    city        { Faker::Address.city_suffix }
  end
end
