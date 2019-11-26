class OrderBooks < ApplicationRecord
  belongs_to :order
  belongs_to :book
end
