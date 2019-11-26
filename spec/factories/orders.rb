FactoryBot.define do
  factory :order do
    state { 0 }
    total { '' }

    trait :with_books do
      books { build_list :book, 3 }
    end

  end
end
