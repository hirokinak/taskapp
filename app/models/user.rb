class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true
  has_many :tasks, dependent: :destroy
end
