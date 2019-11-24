class Address < ApplicationRecord

  validates :street,
            presence: true,

  validates :neigborhood,
            presence: true

  validates :city,
            :presence

  validates :state,
            presence: true

  validates :zipcode,
            presence: true

  belongs_to :user
end