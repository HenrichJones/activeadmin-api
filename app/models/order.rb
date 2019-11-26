class Order < ApplicationRecord
  has_many :order_books, class_name: 'OrderBooks'
  has_many :books, through: :order_books
  belongs_to :user

  validates :state,
            presence: true

  validates :total,
            presence: true
end
