FactoryBot.define do

  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { '12345678' }
    password_confirmation { '12345678' }
    
    trait :with_addresses do
      create_list { :address }
    end
  end

end
