class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  
  scope :order_by_created_at, -> { order('created_at DESC') }

  validates :username,
            presence:  true

  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: { case_sensitive: false }

  has_many :addresses

end
