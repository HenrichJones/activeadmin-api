class OrderBooks < ApplicationRecord
  scope :find_by_book, -> (id) { where(book_id: id) }

  belongs_to :order
  belongs_to :book
end
