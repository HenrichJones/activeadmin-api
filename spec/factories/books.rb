FactoryBot.define do
  factory :book do
    title { Faker::Hipster.sentence }
    description { Faker::Hipster.paragraph(sentence_count: 2) }
    author { Faker::Name.name_with_middle }
    price { "123.3" }
    featured { true }
    avaiable_on { Date.today }
    image_file_name { "" }
  end

end
