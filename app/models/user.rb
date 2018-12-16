class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 100 }
  validates :password_digest, presence: true, length: { maximum: 15 }

  has_many :tasks
end
