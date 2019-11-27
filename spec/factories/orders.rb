FactoryBot.define do
  factory :order do
    state { 0 }
    total { '' }
    user

    trait :with_books do
      books { build_list :book, 2 }
      total { (books.first.price + books.last.price).to_s }
    end

  end
end
