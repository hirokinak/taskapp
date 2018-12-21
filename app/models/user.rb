class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 100 }

  has_many :tasks
end
