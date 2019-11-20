class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  validates :username,
            presence:  true

  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: { case_sensitive: false }

  belongs_to :address
end
