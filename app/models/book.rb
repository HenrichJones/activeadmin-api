class Book < ApplicationRecord
  has_many :order_books, class_name: 'OrderBooks'
  has_many :orders, through: :order_books

  validates :title,
            presence: true

  validates :description,
            presence: true

  validates :author,
            presence: true

  validates :price,
            presence: true

  validates :avaiable_on,
            presence: true

end
