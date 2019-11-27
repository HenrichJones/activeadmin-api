FactoryBot.define do
  factory :book do
    title { Faker::Hipster.sentence }
    description { Faker::Lorem.paragraphs }
    author { Faker::Name.name_with_middle }
    price { 123.3 }
    featured { true }
    avaiable_on { Date.today }
    image_file_name { '' }
  end

end
