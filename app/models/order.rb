class Order < ApplicationRecord

  scope :in_progress, -> { where(state: :in_progress) }
  scope :completed, -> { where(state: :completed) }

  has_many :order_books, class_name: 'OrderBooks'
  has_many :books, through: :order_books
  belongs_to :user

  validates :state,
            presence: true

  validates :total,
            presence: true

  enum state: [
    :completed,
    :in_progress
  ]
end
